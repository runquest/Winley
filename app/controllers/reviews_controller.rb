class ReviewsController < ApplicationController
    
  def new
    @bottle = Bottle.find(params[:bottle_id])
    @review = @bottle.reviews.build
  end

  def create
    @bottle = Bottle.find(params[:bottle_id])
    @review = @bottle.reviews.build(review_params)
    @review.user_id = current_user.id

      if @review.save
        @bottle.reviews << @review
        current_user.reviews << @review
        redirect_to @bottle, notice: "Review created successfully"
      else
        render :new
      end
  end

  def edit
    @bottle = Bottle.find(params[:bottle_id])
    @review = @bottle.reviews.find(params[:id])
  end

  def update
    @bottle = Bottle.find(params[:bottle_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to bottle_path(@bottle)
    else
      render :edit
    end
  end

  def destroy
    @bottle = Bottle.find(params[:bottle_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @bottle, notice: "Review deleted"
  end

  protected

  def review_params
    params.require(:review).permit(:user_id, :bottle_id, :comment, :my_rating, :favorite)
  end
end