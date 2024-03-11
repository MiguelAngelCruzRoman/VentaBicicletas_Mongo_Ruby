class Ventum
  include Mongoid::Document
  include Mongoid::Timestamps

  field :tienda_id, type: BSON::ObjectId
  field :empleado_id, type: BSON::ObjectId
  field :monto_total, type: Integer
  field :fecha_venta, type: DateTime
  field :metodo_pago, type: String
  field :observaciones, type: String

  embeds_one :bicicleta_vendida
  embeds_one :datos_cliente
end

class BicicletaVendida
  include Mongoid::Document

  field :producto_id, type: BSON::ObjectId
  field :cantidad, type: Integer

  embedded_in :venta
end

class DatosCliente
  include Mongoid::Document

  field :nombre, type: String
  field :apellido, type: String
  field :correo, type: String
  field :telefono, type: String

  embedded_in :venta
end
