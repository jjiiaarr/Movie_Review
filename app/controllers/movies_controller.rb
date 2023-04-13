class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.new(params[:movie].permit(:title, :blurb, :date_released, :country, :showing_start, :showing_end))
    if movie.save
      redirect_to movies_path
    end
  end
end
