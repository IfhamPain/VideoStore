class GenresController < ApplicationController
  include ApplicationHelper
  before_action :is_guest, only: [:edit, :update, :index, :create, :new, :destroy]

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:info] = "Genre created successfully"
      redirect_to(genres_path)
    else
      flash.now[:messages] = @genre.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def new
    @genre = Genre.new
  end

  def edit
    set_genre
  end

  def update
    set_genre

    if @genre.update(genre_params)
      redirect_to genres_path, notice: 'Update success'
    else
      render 'edit'
    end
  end

  def destroy
    set_genre
    @genre.destroy!

    respond_to do |format|
      format.html { redirect_to genres_path, notice: 'Genre was successfully destroyed.' }
    end
  end

  protected

  def genre_params
    params.require(:genre).permit(:genre)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
