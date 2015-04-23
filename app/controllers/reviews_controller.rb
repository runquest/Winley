class ReviewsController < ApplicationController

	# before_filter :load_bottle

 # def new
 #    @bottle = Bottle.find(params[:bottle_id])
 #    @review = @bottle.reviews.build
 #  end

 #  def create
 #    @bottle = Bottle.find(params[:bottle_id])
 #    @review = @bottle.reviews.build(review_params)
 #    @review.user_id = current_user.id

 #    if @review.save
 #      redirect_to @bottle, notice: "Review created successfully"
 #    else
 #      render :new
 #    end
 #  end

 #  protected

 #  def load_movie
 #    @bottle = Bottle.find(params[:bottle_id])
 #  end

 #  def review_params
 #    params.require(:review).permit(:user_id, :bottle_id, :my_rating, :comment, :favorite)
 #  end



end
