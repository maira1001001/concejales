Rails.application.routes.draw do

  root 'projects#index'


  resources :projects, path: 'proyectos',
    path_names: { new: 'nuevo', edit: 'editar', show: 'detalles' }

  resources :collaborators, path: 'asesores'
  resources :councilors,    path: 'concejales'
  resources :people,        path: 'personas'

  get 'asignar-asesor', to: "users#assign_collaborator_to_councilor",
    as: :assign_collaborators_to_councilor_user

  devise_scope :user do
    get 'iniciar-sesion', to: 'devise/sessions#new'
    put "/confirm" => "users/confirmations#confirm"
  end

  devise_for :users, controllers: {  confirmation: "users/confirmation",
                                     sessions:     "users/sessions",
                                     registrations: "users/registrations" }

  resources :users, path: 'usuarios', path_names: {new: 'nuevo', edit: 'modificar'}

  #  resources :ordinances, path: 'proyectos/ordenanzas'
  #  resources :decrees, path: 'proyectos/decretos'
  #  resources :resolutions, path: 'proyectos/resoluciones'
  #  resources :communications, path: 'proyectos/comunicaciones'
  #  resources :documents, path: 'proyectos/documentos'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  concern :toggleable do
    post 'toggle'
  end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
