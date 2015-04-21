class BottlesController < ApplicationController

	def bottle_home
    @bottles = Bottle.all
  end

  def new
    @bottle = Bottle.new
  end

  def create
    @bottle = Bottle.new(bottle_params)


    if @bottle.save
      current_user.bottles << @bottle
      redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
    else
      render :new
    end
  end

  def show
     @bottles= bottle.all
  end


  def destroy
    @bottle = bottle.find(params[:id])
    @bottle.destroy
    redirect_to root
  end

  def edit
      @bottle = bottle.find(params[:id])
  end

   def update
    @bottle = bottle.find(params[:id])

    if @bottle.update_attributes(bottle_params)
      redirect_to user_path
    else
      render :edit
    end
  end 

  protected

  def bottle_params
    params.require(:bottle).permit(:name, :type, :grape, :vintage, :winery, :region, :alcohol, :price, :description)
  end

end