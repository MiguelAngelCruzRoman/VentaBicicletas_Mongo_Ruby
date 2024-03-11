class Api::V1::VentasController < ApplicationController
    before_action :getVenta, only: [:updateVenta, :deleteVenta, :showVenta]
  
    def getVentas
      ventas = Ventum.all
      if ventas.present?
        render json: ventas, status: :ok
      else
        render json: { message: "La colección de ventas está vacía" }, status: :unprocessable_entity
      end
    end
  
    def addVenta
      venta = Ventum.new(
        tienda_id: params[:tienda_id],
        empleado_id: params[:empleado_id],
        monto_total: params[:monto_total],
        fecha_venta: params[:fecha_venta],
        metodo_pago: params[:metodo_pago],
        observaciones: params[:observaciones]
      )
  
      venta.bicicleta_vendida = BicicletaVendida.new(
        producto_id: params[:bicicleta_vendida_producto_id],
        cantidad: params[:bicicleta_vendida_cantidad]
      )
  
      venta.datos_cliente = DatosCliente.new(
        nombre: params[:datos_cliente_nombre],
        apellido: params[:datos_cliente_apellido],
        correo: params[:datos_cliente_correo],
        telefono: params[:datos_cliente_telefono]
      )
  
      if venta.save
        render json: venta, status: :ok
      else
        render json: { message: "Venta no agregada" }, status: :unprocessable_entity
      end
    end
  
    def showVenta
      if @venta
        render json: @venta, status: :ok
      else
        render json: { message: "Venta no encontrada" }, status: :unprocessable_entity
      end
    end
  
    def updateVenta
      if @venta
        if @venta.update(venta_params)
          render json: @venta, status: :ok
        else
          render json: { message: "Venta no actualizada" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Venta no encontrada" }, status: :unprocessable_entity
      end
    end
  
    def deleteVenta
      if @venta
        if @venta.destroy
          render json: { message: "Venta eliminada" }, status: :ok
        else
          render json: { message: "Venta no eliminada" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Venta no encontrada" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def venta_params
      params.permit(
        :tienda_id,
        :empleado_id,
        :monto_total,
        :fecha_venta,
        :metodo_pago,
        :observaciones,
        bicicleta_vendida: [:producto_id, :cantidad],
        datos_cliente: [:nombre, :apellido, :correo, :telefono]
      )
    end
  
    def getVenta
      @venta = Ventum.find(params[:id])
    end
  end
  