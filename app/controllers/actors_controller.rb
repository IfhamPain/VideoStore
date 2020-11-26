class ActorsController < ApplicationController
  include ApplicationHelper
  before_action :is_guest, only: [:edit, :update, :index, :create, :new, :destroy]

  def index
    search_actors || @actors = Actor.order(:name).page(params[:page])
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:info] = "Actor created successfully"
      redirect_to(@actor)
    else
      flash.now[:messages] = @actor.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def new
    @actor = Actor.new
  end

  def edit
    set_actor
  end

  def update
    set_actor

    if @actor.update(actor_params)
      redirect_to @actor, notice: 'Update success'
    else
      render 'edit'
    end
  end

  def show
    set_actor
  end

  def destroy
    set_actor
    @actor.destroy!

    respond_to do |format|
      format.html { redirect_to actors_path, notice: 'Actor was successfully destroyed.' }
    end
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :date_of_birth, movie_ids: [])
  end

  def search_actors
    @actors = Actor.filter(params.slice(:name)).order(:name).page(params[:page])
  end

  def set_actor
    @actor = Actor.find(params[:id])
  end

end
