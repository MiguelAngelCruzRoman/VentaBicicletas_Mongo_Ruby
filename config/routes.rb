Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do

      #rutas referentes a los empleado
      get 'getEmpleados', action: :getEmpleados, controller: :empleados
      post 'addEmpleado', action: :addEmpleado,controller: :empleados
      get 'showEmpleado', action: :showEmpleado,controller: :empleados
      put 'updateEmpleado', action: :updateEmpleado,controller: :empleados
      delete 'deleteEmpleado', action: :deleteEmpleado,controller: :empleados


      #rutas referentes a las tiendas
      get 'getTiendas', action: :getTiendas, controller: :tiendas
      post 'addTienda', action: :addTienda,controller: :tiendas
      get 'showTienda', action: :showTienda,controller: :tiendas
      put 'updateTienda', action: :updateTienda,controller: :tiendas
      delete 'deleteTienda', action: :deleteTienda,controller: :tiendas
    end
  end
end
