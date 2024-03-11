class Tienda
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nombre, type: String
  field :telefono, type: String
  field :horario, type: String

  embeds_one :direccion
end

class Direccion
  include Mongoid::Document

  field :calle, type: String
  field :numero, type: String
  field :colonia, type: String
  field :ciudad, type: String
  field :estado, type: String
  field :codigoPostal, type: Integer
  field :pais, type: String

  embedded_in :tienda
end
