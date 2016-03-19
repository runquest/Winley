class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
      
    if @region.save
        redirect_to region_path(@region)
        flash[:notice] = "You just added #{@region.name}!"
    else
      render :new
    end
  end

  def show
   @region = Region.find(params[:id])     
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    flash[:notice] = "You just deleted #{@region.name}!"
    redirect_to root_path
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update_attributes(region_params)
      redirect_to region_path
      flash[:notice] = "You just updated #{@region.name}!"
    else
      render :edit
    end
  end

  protected

  def regions_params
    params.require(:region).permit(:name, :location, :description)
  end
end