class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: create_params[:email])
    if @user.present?
      puts(create_params[:password])
      if @user.valid_password?(create_params[:password])
        render json: @user, status: :created
      else        
        render message: "Error usuario constraseña incorrecta", status: :unprocessable_entity
      end
    else
      render message: "Error usuario no encontrado", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private 

  def create_params 
    params.permit(:email, :password)
  end
end
