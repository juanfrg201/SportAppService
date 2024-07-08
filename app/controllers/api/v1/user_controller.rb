class Api::V1::UserController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(update_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show 
    @user = User.find(params[:id])
    if @user.present?
      render json: @user, status: :ok
    else
      render json: "No se encontro", status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :last_name, :email, :password, :password_confirmation)
  end

  def update_params
    params.permit(:name, :last_name, :email, :password, :password_confirmation).compact
  end
  
  
end
