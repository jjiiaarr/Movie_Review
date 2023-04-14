class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie].permit(:title, :blurb, :date_released, :country, :showing_start, :showing_end))
    if @movie.save
      redirect_to movies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(params.require(:movie).permit(:title, :blurb, :date_released, :country, :showing_start, :showing_end))
      flash[:notice] = 'Movie updated successfully'
      redirect_to movies_path
    else
      flash.now[:alert] = 'Movie update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movies = Movie.find(params[:id])
    @movies.destroy
    flash[:notice] = 'Movie deleted successfully'
    redirect_to movies_path
  end
end
