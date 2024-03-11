class Empleado
  include Mongoid::Document
  include Mongoid::Timestamps

  field :primerNombre, type: String
  field :segundoNombre, type: String, default: ""
  field :apellidoPaterno, type: String
  field :apellidoMaterno, type: String
  field :correo, type: String
  field :telefono, type: String
  field :puesto, type: String
  field :fechaContratacion, type: DateTime

end
