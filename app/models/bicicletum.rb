class Bicicletum
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nombre, type: String
  field :tipo, type: String
  field :marca, type: String
  field :precio, type: Integer

  embeds_one :caracteristicas
end

class Caracteristica
  include Mongoid::Document

  field :material, type: String
  field :talla, type: String
  field :color, type: String
  field :velocidades, type: Integer

  embedded_in :bicicleta
end

