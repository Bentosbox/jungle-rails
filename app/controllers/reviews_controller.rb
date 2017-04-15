class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: "Review Saved"
    else
      render "products/show"
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to review.product, notice: "Review Removed"
  end

  private
  def review_params
    params.require(:review).permit(
      :product_id,
      :description,
      :rating
    )
  end
end
