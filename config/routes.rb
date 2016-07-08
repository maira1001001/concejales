Rails.application.routes.draw do

  root 'projects#index'


  resources :projects, path: 'proyectos',
    path_names: { new: 'nuevo', edit: 'editar', show: 'detalles' }

  resources :people, path: 'personas'


  resource :term, path: 'mi-equipo'

  get 'mis-proyectos', to: 'projects#my_projects', as: :my_projects

  devise_scope :user do
    put "/confirm" => "users/confirmations#confirm"
  end

  devise_for :users, controllers: { confirmations: "users/confirmations", sessions: "users/sessions", registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, path: 'usuarios', path_names: {new: 'nuevo', edit: 'modificar'}

end
