class BottlesController < ApplicationController

	def index
    @bottles = Bottle.all
  end

  def new
    @bottle = Bottle.new
    @review = Review.new
  end

  def create
    @bottle = Bottle.new(bottle_params)
    if current_user == nil
      @bottle.save
      redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
    else
      @bottle.save
      @review = Review.new(review_params)
      @review.save
      @review.user = current_user
      @bottle.reviews << @review
      redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
    end
  end

  def show
     @bottle = Bottle.find(params[:id])
     @review = Review.find(params[:id])
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
    @review = Review.new(review_params)

    if @bottle.save
      if current_user == nil
        redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
      else
        current_user.bottles << @bottle
        @review.user = current_user
        @review.bottle = @bottle
        @review.save
        redirect_to bottle_path(@bottle), notice: "#{@bottle.name}!"
      end
    else
      render :new
    end

  end 

  protected

  def bottle_params
    params.require(:bottle).permit(:name, :grape, :vintage, :winery, :description)
  end

  def review_params
    params.require(:review).permit(:user_id, :bottle_id, :my_rating, :comment, :favorite)
  end
end