class Tienda
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nombre, type: String
  field :telefono, type: String
  field :horario, type: String

  field :direccion_calle, type: String
  field :direccion_ciudad, type: String
  field :direccion_estado, type: String
  field :direccion_pais, type: String

  # embeds_many :empleados

end
