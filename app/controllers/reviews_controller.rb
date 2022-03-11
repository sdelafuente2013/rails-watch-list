class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.list = List.find(params[:id])

    if @review.save
      redirect_to list_path
    else
        render :create, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end 
end
