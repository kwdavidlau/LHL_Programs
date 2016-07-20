# require 'pry'
class MoviesController < ApplicationController
  before_filter :restrict_access
  # before_filter :pretend_user

  def index

    if params[:sort]
      @movies = Movie.all.order(params[:sort])
    else
      @movies = Movie.all
      @movies = @movies.where(title: [params[:title]]) unless params[:title].nil? || params[:title].empty?
      @movies = @movies.where(director: [params[:director]]) unless params[:director].nil? || params[:director].empty?
      if !params[:runtime_in_minutes].nil? && !params[:runtime_in_minutes].empty?
        case params[:runtime_in_minutes]
        when "Under 90 minutes"
          
          @movies = @movies.where('runtime_in_minutes < ?', 90)
        when "Between 90 and 120 minutes"
          @movies = @movies.where('runtime_in_minutes > ?', 90).where('runtime_in_minutes < ?', 120)
        when "Over 120 minutes"
          @movies = @movies.where('runtime_in_minutes > ?', 120)
        else
          @movies
        end
      end

    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  # def sort1
  #   @movies = Movie.all.order(params[:title])
  # end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
    )
  end

end
