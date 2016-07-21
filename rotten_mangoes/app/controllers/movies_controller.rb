# require 'pry'
class MoviesController < ApplicationController
  before_filter :restrict_access
  # before_filter :pretend_user

  def index
    @movies = Movie.all
    # @movies = Movie.by_title(params) unless params[:title].nil? || params[:title].empty?
    # @movies = @movies.by_director(params) unless params[:director].nil? || params[:director].empty?

    @movie1 = Movie.by_title(params) unless params[:search].nil? || params[:search].empty?
    #search for movies under the title parameter as long as its not empty
    @movie2 = Movie.by_director(params) unless params[:search].nil? || params[:search].empty?
    #search for movies under the director parameter as long as its not empty
    @movies = @movies.by_runtime(params) unless params[:runtime_in_minutes].nil? || params[:runtime_in_minutes].empty?
    #search for movies under runtime parameter as long as its not empty

    # if (!@movie1.nil? && !@movie1.empty?) || (!@movie2.nil? && !@movie2.empty?)
    if (!@movie1.nil? || !@movie2.nil?) && (params[:runtime_in_minutes].nil? || params[:runtime_in_minutes].empty?)
      #there are movies when you input a search for title/director, but with no input from runtime
        @movies = @movie1
        @movies = @movies + @movie2
    elsif (!@movie1.nil? || !@movie2.nil?) && (!params[:runtime_in_minutes].nil? || !params[:runtime_in_minutes].empty?)
      #there are movies when you input a search for title/director AND you also have a search term for run_time
        @movies = Movie.by_runtime(params)
        @movie_temp1 = @movies.by_title(params)
        @movie_temp2 = @movies.by_director(params)
        @movies = @movie_temp1
        @movies = @movies + @movie_temp2
    end


    # if params[:sort]
    #   @movies = Movie.all.order(params[:sort])
    # else
    #   @movies = Movie.all
      # @movies = @movies.where(title: [params[:title]]) unless params[:title].nil? || params[:title].empty?
      # @movies = @movies.where(director: [params[:director]]) unless params[:director].nil? || params[:director].empty?
      # if !params[:runtime_in_minutes].nil? && !params[:runtime_in_minutes].empty?
      #   case params[:runtime_in_minutes]
      #   when "Under 90 minutes"
      #     @movies = @movies.where('runtime_in_minutes < ?', 90)
      #   when "Between 90 and 120 minutes"
      #     @movies = @movies.where('runtime_in_minutes > ?', 90).where('runtime_in_minutes < ?', 120)
      #   when "Over 120 minutes"
        #     @movies = @movies.where('runtime_in_minutes > ?', 120)
      #   else
      #     @movies
      #   end
      # end

    # end
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
