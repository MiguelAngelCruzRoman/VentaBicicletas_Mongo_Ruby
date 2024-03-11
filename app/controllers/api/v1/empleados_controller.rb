class Api::V1::EmpleadosController < ApplicationController
    before_action :getEmpleado, only: [:updateEmpleado,:deleteEmpleado,:showEmpleado]


    def getEmpleados
        empleado =Empleado.all
        if empleado
            render json: empleado, status: :ok
        else
            render json: {message: "La coleeción de Empleado está vacía"}, status: :unprocessable_entity
        end
    end


    def addEmpleado
        empleado = Empleado.new(
            primerNombre: params[:primerNombre],
            segundoNombre: params[:segundoNombre],
            apellidoPaterno: params[:apellidoPaterno],
            apellidoMaterno: params[:apellidoMaterno],
            correo: params[:correo],
            telefono: params[:telefono],
            puesto: params[:puesto],
            fechaContratacion: DateTime.parse(params[:fechaContratacion]))
        
        if empleado.save()
            render json: empleado, status: :ok
        else 
            render json: {message: "Empleado no agregado"}, status: :unprocessable_entity
        end
    end

    def showEmpleado
        if @empleado
            render json: @empleado, status: :ok
        else
            render json: {message: "Empleado no agregado"}, status: :unprocessable_entity
        end
    end

    def updateEmpleado
        if @empleado
            if @empleado.update(empleadoparams)
                render json: @empleado, status: :ok
            else
                render json: {message: "Empleado no actualizado"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Empleado no encontrado"}, status: :unprocessable_entity
        end
    end


    def deleteEmpleado
        if @empleado
            if @empleado.destroy()
                render json: {message: "Empleado eliminado"}, status: :ok
            else
                render json: {message: "Empleado no eliminado"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Empleado no encontrado"}, status: :unprocessable_entity
        end
    end

    private
        def empleadoparams
            params.permit(
                :primerNombre,
                :segundoNombre,
                :apellidoPaterno,
                :apellidoMaterno,
                :correo,
                :telefono,
                :puesto,
                :fechaContratacion)
        end

        def getEmpleado
            @empleado = Empleado.find(params[:id])
        end
end
