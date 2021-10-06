class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    render json: User.all 
  end

  def create
    user = User.new(user_params)
    if user.save! 
      render json: user 
    else
      render json: user.errors.full_messages
    end 
  end

  def new
  end

  def edit
  end

  def show
    render json: params
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
