class PersonalPortfoliosController < ApplicationController
    def index
        @portfolio_items = PersonalPortfolio.all
    end

    def show
        @portfolio_item = PersonalPortfolio.find(params[:id])
    end

    def new
        @portfolio_item = PersonalPortfolio.new
    end

    def create
        @portfolio_item = PersonalPortfolio.new(params.require(:personal_portfolio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to personal_portfolios_path, notice: 'Portfolio item was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    def edit
        @portfolio_item = PersonalPortfolio.find(params[:id])
    end
    
    def update
        @portfolio_item = PersonalPortfolio.find(params[:id])
        
        respond_to do |format|
            if @portfolio_item.update(params.require(:personal_portfolio).permit(:title, :subtitle, :body))
                format.html { redirect_to personal_portfolios_path, notice: 'Portfolio item was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        # Perform the lookup
        @portfolio_item = PersonalPortfolio.find(params[:id])
        
        # Delete/destroy the record
        @portfolio_item.destroy

        # Redirect
        respond_to do |format|
            format.html { redirect_to personal_portfolios_url, notice: 'Portfolio item was removed.' }
        end
      end
end