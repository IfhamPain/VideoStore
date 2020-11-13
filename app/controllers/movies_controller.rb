class MoviesController < ApplicationController
  def index
    search_movies
  end
  def show
    @movie = Movie.find_by_id(params[:id])
  end
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:info] = "Movie created successfully"
      redirect_to(root_url)
    else
      flash.now[:messages] = @movie.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie =  Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Update success'
    else
      render 'edit'
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    flash[:success] = "Movie was deleted"
    redirect_to movies_url
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :description, :content, :address, :thumbnail, genre_ids:[], actor_ids:[], actors_attributes: [:id, :name, :date_of_birth, :_destroy])
  end

  def search_movies
    @movies = Movie.text_search(params[:query]) || Movie.all
  end

end
