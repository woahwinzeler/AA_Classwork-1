class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    render json: User.all 
  end

  def create
    user = User.new(user_params)
    # debugger
    if user.save
      render json: user 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end

  def new
  end

  def edit
    user = User.update(params[:id], user_params)
    render json: user
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render plain: "user destroyed"
    else
      render plain: "user not destroyed"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
