class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant, notice: 'Review Posted'
    else
      render 'restaurants/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @restaurant = @review.restaurant
    redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
