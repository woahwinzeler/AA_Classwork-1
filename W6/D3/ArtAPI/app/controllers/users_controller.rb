class UsersController < ApplicationController
  def index
    render json: User.all 
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end

  def show
    user = User.find(params[:id])
    render json: user 
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params) 
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages, status: :not_modified 
    end 
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user #need to render deleted user 

  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end 
end
