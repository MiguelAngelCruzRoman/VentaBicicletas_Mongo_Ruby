class Api::V1::BicicletasController < ApplicationController
    before_action :getBicicleta, only: [:updateBicicleta,:deleteBicicleta,:showBicicleta]


    def getBicicletas
        bicicleta =Bicicletum.all
        if bicicleta
            render json: bicicleta, status: :ok
        else
            render json: {message: "La coleeción de Bicicleta está vacía"}, status: :unprocessable_entity
        end
    end


    def addBicicleta
        bicicleta = Bicicletum.new(
          nombre: params[:nombre],
          tipo: params[:tipo],
          marca: params[:marca],
          precio: params[:precio],
          caracteristicas: Caracteristicas.new(
            material: params[:caracteristicas_material],
            talla: params[:caracteristicas_talla],
            color: params[:caracteristicas_color],
            velocidades: params[:caracteristicas_velocidades]
          )
        )
        
        if bicicleta.save
          render json: bicicleta, status: :ok
        else 
          render json: { message: "Bicicleta no agregada"}, status: :unprocessable_entity
        end
      end
      

    def showBicicleta
        if @bicicleta
            render json: @bicicleta, status: :ok
        else
            render json: {message: "Bicicleta no agregada"}, status: :unprocessable_entity
        end
    end

    def updateBicicleta
        if @bicicleta
            if @bicicleta.update(bicicletaparams)
                render json: @bicicleta, status: :ok
            else
                render json: {message: "Bicicleta no actualizada"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Bicicleta no encontrada"}, status: :unprocessable_entity
        end
    end


    def deleteBicicleta
        if @bicicleta
            if @bicicleta.destroy()
                render json: {message: "Bicicleta eliminada"}, status: :ok
            else
                render json: {message: "Bicicleta no eliminada"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Bicicleta no encontrada"}, status: :unprocessable_entity
        end
    end

    private
        def bicicletaparams
            params.permit(
            :nombre,
            :tipo,
            :marca,
            :precio,
            caracteristicas: [:caracteristicas_material, 
            :caracteristicas_talla, 
            :caracteristicas_color, 
            :caracteristicas_velocidades]
            )
        end

        def getBicicleta
            @bicicleta = Bicicletum.find(params[:id])
        end
end
