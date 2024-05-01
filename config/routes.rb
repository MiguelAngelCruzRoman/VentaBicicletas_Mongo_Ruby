Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do

      #rutas referentes a las bicicletas
      get 'getBicicleta', action: :getBicicletas, controller: :bicicletas
      post 'addBicicleta', action: :addBicicleta,controller: :bicicletas
      get 'showBicicleta', action: :showBicicleta,controller: :bicicletas
      put 'updateBicicleta', action: :updateBicicleta,controller: :bicicletas
      delete 'deleteBicicleta', action: :deleteBicicleta,controller: :bicicletas


      #rutas referentes a los empleado
      get 'getEmpleados', action: :getEmpleados, controller: :empleados
      post 'addEmpleado', action: :addEmpleado,controller: :empleados
      get 'showEmpleado', action: :showEmpleado,controller: :empleados
      put 'updateEmpleado', action: :updateEmpleado,controller: :empleados
      delete 'deleteEmpleado', action: :deleteEmpleado,controller: :empleados

      resources :tiendas do
        collection do
          get :getTiendas
          post :addTienda
        end
        member do
          get :showTienda
          patch :updateTienda
          delete :deleteTienda
        end
      end


      #rutas referentes a las ventas
      get 'getVentas', action: :getVentas, controller: :ventas
      post 'addVenta', action: :addVenta,controller: :ventas
      get 'showVenta', action: :showVenta,controller: :ventas
      put 'updateVenta', action: :updateVenta,controller: :ventas
      delete 'deleteVenta', action: :deleteVenta,controller: :ventas
    end
  end
end
