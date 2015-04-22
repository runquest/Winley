class BottlesController < ApplicationController

	def index
    @bottles = Bottle.all
  end

  def new
    @bottle = Bottle.new
  end

  def create
    @bottle = Bottle.new(bottle_params)

    if @bottle.save
      redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
    else
      render :new
    end
  end

  def show
     @bottle = Bottle.find(params[:id])
  end


  def destroy
    @bottle = Bottle.find(params[:id])
    @bottle.destroy
    redirect_to root
  end

  def edit
      @bottle = Bottle.find(params[:id])
  end

   def update
    @bottle = Bottle.find(params[:id])

    if @bottle.update_attributes(bottle_params)
      redirect_to user_path
    else
      render :edit
    end
  end 

  protected

  def bottle_params
    params.require(:bottle).permit(:name, :color, :grape, :vintage, :winery, :region, :alcohol, :price, :description)
  end

end