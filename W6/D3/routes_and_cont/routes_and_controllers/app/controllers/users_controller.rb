class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: params
  end

  def create
    render json: params
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
end
