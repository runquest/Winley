class WineriesController < ApplicationController

  def index
    @wineries = Winery.all
  end

  def new
    @winery = Winery.new
  end

  def create
    @winery = Winery.new(winery_params)
    @region = Region.find(:region_id)
      
    if @winery.save
        @region.wines << @winery
        redirect_to winery_path(@winery)
        flash[:notice] = "You just added #{@winery.name}!"
    else
      render :new
    end
  end

  def show
   @winery = Winery.find(params[:id])     
  end

  def destroy
    @winery = Winery.find(params[:id])
    @winery.destroy
    flash[:notice] = "You just deleted #{@winery.name}!"
    redirect_to root_path
  end

  def edit
    @winery = Winery.find(params[:id])
  end

  def update
    @winery = Winery.find(params[:id])
    if @winery.update_attributes(winery_params)
      redirect_to winery_path
      flash[:notice] = "You just updated #{@winery.name}!"
    else
      render :edit
    end
  end

  protected

  def winery_params
    params.require(:winery).permit(:region_id, :name, :description)
  end

end