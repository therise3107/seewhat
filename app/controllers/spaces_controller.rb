class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:new, :edit, :update, :destroy]
  before_action :own_auth, only: [:new, :edit, :update, :destroy]

  respond_to :html

  def index
    @spaces = Space.all
    respond_with(@spaces)
  end

  def show
    respond_with(@space)
  end

  def new
    @space = Space.new
    respond_with(@space)
  end

  def edit
  end

  def create
    @space = Space.new(space_params)
    @space.user_id = current_user.id
    @space.save
    respond_with(@space)
  end

  def update
    @space.update(space_params)
    respond_with(@space)
  end

  def destroy
    @space.destroy
    respond_with(@space)
  end

  private
    def set_space
      @space = Space.find(params[:id])
    end

    def space_params
      params.require(:space).permit(:planet, :des)
    end

    def own_auth
      if !user_signed_in? || current_user != Space.find(params[:id])
        redirect_to root_path, notice: "You cannot do this!Sorry!"
      end
    end
end
