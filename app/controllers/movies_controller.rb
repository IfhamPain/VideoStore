class MoviesController < ApplicationController
  include ApplicationHelper
  before_action :is_guest, only: [:edit, :update, :index, :create, :new, :destroy]
  def index
    search_movies
    @movies = @movies.order(:title).page(params[:page])
  end
  def show
    @movie = Movie.find_by_id(params[:id])
  end
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      flash.now[:messages] = @movie.errors.full_messages.to_sentence
      render :new
    end
  rescue ActiveRecord::RecordNotUnique
    flash[:notice] = 'Unable to create Item'
    render :new
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
      flash.now[:messages] = @movie.errors.full_messages.to_sentence
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
    params.require(:movie).permit(:title, :description, :content, :address, :thumbnail,  movie_copies_attributes: MovieCopy.attribute_names.map(&:to_sym), genre_ids:[], actor_ids:[], actors_attributes: Actor.attribute_names.map(&:to_sym).push(:_destroy))
  end

  def search_movies
    @movies = Movie.text_search(params[:query]) || Movie.all
  end

end
