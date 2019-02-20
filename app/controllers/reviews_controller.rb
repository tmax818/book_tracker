class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :update_review, only: [:edit]

  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @review = Review.new
  end

  def edit

  end

  def create
    @review = Review.create(review_params)
    @review.user_id = current_user.id
     if @review.save
       redirect_to @review
     else
       render :new
     end
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:danger] = "Review Deleted"
    redirect_to user_path(current_user.id)
  end

  private
    def review_params
      params.require(:review).permit(:content, :book_id)
    end

    def find_review
      @review = Review.find(params[:id])
    end

    def update_review
      unless logged_in? && current_user[:id] == @review.user_id
        flash[:danger] = "You cannot edit this review"
        redirect_to user_path
   end
    end

end
