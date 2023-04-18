class ReviewsController < ApplicationController
  before_action :set_movie
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.build
  end

  def create
    @review = @movie.reviews.build(review_params)
    if @review.save
      flash[:notice] = 'Review created successfully'
      redirect_to movie_reviews_path(@movie)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Review updated successfully'
      redirect_to movie_reviews_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'Review deleted successfully'
    redirect_to movie_reviews_path(@movie)
  end

  private

  def set_movie
    @movie = Movie.find params[:movie_id]
  end

  def set_comment
    @review = @movie.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
