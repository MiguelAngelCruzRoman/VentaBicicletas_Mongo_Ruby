class Api::V1::TiendasController < ApplicationController
    def getTiendas

    end

    def addTienda
        tienda = Tienda.new(
        nombre: params[:nombre],
        telefono: params[:telefono],
        horario: params[:horario],
        direccion_calle: params[:direccion_calle],
        direccion_ciudad: params[:direccion_ciudad],
        direccion_estado: params[:direccion_estado],
        direccion_pais: params[:direccion_pais])

        if tienda.save()
            render json: tienda, status: :ok
        else 
            render json: {message: "Tienda no agregada"}, status: :unprocessable_entity
        end
    end
end
