class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    User.create(prototype_params)
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  def edit
  end

  def update
  end

  def show
    @name = current_users.name
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :profile, :occupation, :position ).merge(user_id: current_user.id)
  end

  def set_prototype
    @user = User.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
