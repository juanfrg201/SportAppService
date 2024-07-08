class Api::V1::EjerciceController < ApplicationController

  def create
    user = User.find_by(id: create_params[:user_id])
    if user.present?
      ejercice = user.ejercices.new(create_params.except(:user_id))
      if ejercice.save
        if params[:image].present?
          ejercice.image.attach(params[:image])
        end
        render json: ejercice, status: :created
      else
        render json: { message: 'Error al crear el ejercicio' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'Usuario no encontrado' }, status: :unprocessable_entity
    end
  end

  def index
    day = params[:day]
    user = User.find_by(id: params[:user_id])  # Corregido: usa params directamente en lugar de create_params para encontrar el user_id
    if user.present?
      ejercices = user.ejercices.where(day: day)
      if ejercices.present?
        render json: ejercices, status: :ok
      else
        render json: [], status: :ok  # Renderiza un array vacío si no se encuentran ejercicios
      end
    else
      render json: { message: 'Usuario no encontrado' }, status: :unprocessable_entity
    end
  end

  def destroy 
    ejercice = Ejercice.find(params[:id])
    if ejercice.present?
      if ejercice.destroy
        render message: "Se elimino", status: :ok
      end
    else
      render json: { message: 'Ejercicio no encontrado' }, status: :unprocessable_entity
    end
  end

  private 

  def create_params 
    params.permit(:name, :series, :repeticions, :weight, :day, :user_id, :image)
  end
end
