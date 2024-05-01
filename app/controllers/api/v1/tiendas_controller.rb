class Api::V1::TiendasController < ApplicationController
    before_action :getTienda, only: [:updateTienda,:deleteTienda,:showTienda]


    def getTiendas
        @tiendas = Tienda.all
        if @tiendas.any?
          render 'index', status: :ok
        else
          render json: { message: "La colección de Tienda está vacía" }, status: :unprocessable_entity
        end
      end
      


    def addTienda
        tienda = Tienda.new(
            nombre: params[:nombre],
            telefono: params[:telefono],
            horario: params[:horario],
            direccion: Direccion.new(
              calle: params[:direccion_calle],
              ciudad: params[:direccion_ciudad],
              estado: params[:direccion_estado],
              pais: params[:direccion_pais],
              codigoPostal: params[:direccion_codigoPostal],
              colonia: params[:direccion_colonia],
              numero: params[:direccion_numero]
            )
          )

        if tienda.save()
            render json: tienda, status: :ok
        else 
            render json: {message: "Tienda no agregada"}, status: :unprocessable_entity
        end
    end

    def showTienda
        if @tienda
            render json: @tienda, status: :ok
        else
            render json: {message: "Tienda no encontrada"}, status: :unprocessable_entity
        end
    end

    def updateTienda
        if @tienda
            if @tienda.update(tiendaparams)
                render json: @tienda, status: :ok
            else
                render json: {message: "Tienda no actualizada"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Tienda no encontrada"}, status: :unprocessable_entity
        end
    end


    def deleteTienda
        if @tienda
            if @tienda.destroy()
                render json: {message: "Tienda eliminada"}, status: :ok
            else
                render json: {message: "Tienda no eliminada"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Tienda no encontrada"}, status: :unprocessable_entity
        end
    end

    private
        def tiendaparams
            params.permit(
            :nombre,
            :telefono,
            :horario,
            direccion:[:direccion_calle,:direccion_ciudad,:direccion_estado,:direccion_pais,:direccion_codigoPostal,:direccion_colonia,:direccion_numero])
        end

        def getTienda
            @tienda = Tienda.find(params[:id])
        end
end
