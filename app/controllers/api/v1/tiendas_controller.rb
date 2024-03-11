class Api::V1::TiendasController < ApplicationController
    before_action :getTienda, only: [:updateTienda,:deleteTienda,:showTienda]


    def getTiendas
        tienda =Tienda.all
        if tienda
            render json: tienda, status: :ok
        else
            render json: {message: "Tienda vacía"}, status: :unprocessable_entity
        end
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
            :direccion_calle,
            :direccion_ciudad,
            :direccion_estado,
            :direccion_pais)
        end

        def getTienda
            @tienda = Tienda.find(params[:id])
        end
end
