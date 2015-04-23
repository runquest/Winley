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
      if current_user == nil
        redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
      else
        current_user.bottles << @bottle
        redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
      end
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

      if current_user == nil

        if @bottle.update_attributes(bottle_params)
          redirect_to bottle_path, notice: "#{@bottle.name}!"
        else
          render :edit
        end

      else
          current_user.bottles << @bottle
          redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
      end
  end 

  protected

  def bottle_params
    params.require(:bottle).permit(:name, :grape, :vintage, :winery, :description)
  end

end