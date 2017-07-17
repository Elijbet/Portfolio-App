class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]


	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
        #format.json { render :show, status: :created, location: @portfolios_path }
      else
        format.html { render :new }
        #format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

	 def update
	  respond_to do |format|
	    if @portfolio_item.update(portfolio_params)
	      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
	      #format.json { render :show, status: :ok, location: @portfolios_path }
	    else
	      format.html { render :edit }
	      #format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def show
	end

	def destroy
		@portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
      #format.json { head :no_content }
    end
	end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
  	params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
