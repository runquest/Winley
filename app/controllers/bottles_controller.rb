class BottlesController < ApplicationController

  before_filter :restrict_access, :except => [:show, :index]

  def index
    @bottles = Bottle.all
  end

  def show
   @bottle = Bottle.find(params[:id])     
  end

  def new
    @bottle = Bottle.new
  end

  def edit
    @bottle = Bottle.find(params[:id])
  end

  def create
    @bottle = Bottle.new(bottle_params)
    
    if current_user == nil
      @bottle.save
      redirect_to bottle_path(@bottle)
      flash[:notice] = "You just created #{@bottle.name}!"
    else
      @bottle.save
      @review = @bottle.reviews.build(my_rating: 1, user_id: current_user.id)
      @bottle.reviews << @review
      redirect_to bottle_path(@bottle)
      flash[:notice] = "You just created #{@bottle.name}!"
    end
  end

  def destroy
    @bottle = Bottle.find(params[:id])
    @bottle.destroy
    flash[:notice] = "You just deleted #{@bottle.name}!"
    redirect_to root_path
  end

  def update
    @bottle = Bottle.find(params[:id])
    if @bottle.update_attributes(bottle_params)
      redirect_to bottle_path
      flash[:notice] = "You just updated #{@bottle.name}!"
    else
      render :edit
    end
  end

  def add_to_library
    @bottle = Bottle.find(params[:id])
    @review = @bottle.reviews.build(my_rating: 1, user_id: current_user.id)
    @bottle.reviews << @review
    redirect_to bottle_path(@bottle)
  end

  def remove_from_library
    @bottle = Bottle.find(params[:id])
    current_user.bottles.delete(@bottle)
    redirect_to bottle_path(@bottle)
  end

  # Calculates an average rating for the bottle
  def average_rating
    @bottle = Bottle.find(params[:id])
    @reviews = @bottle.reviews

    my_total_rating = 1
    @reviews.each do |review|
      my_total_rating += review.my_rating
    end

    number_of_reviews = 1
    if @reviews.count >= 1
      number_of_reviews = @reviews.count
      my_total_rating -= 1
    end

      my_average_rating = my_total_rating / number_of_reviews
    return my_average_rating
  end

  helper_method :average_rating

  protected

  def bottle_params
    params.require(:bottle).permit(:winery_id, :name, :grape, :vintage, :label_image, :more_url, :description)
  end
end








