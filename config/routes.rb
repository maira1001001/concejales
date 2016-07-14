Rails.application.routes.draw do

  root 'projects#index'


  resources :projects, path: 'proyectos',
    path_names: { new: 'nuevo', edit: 'editar' }

  resources :people, path: 'personas'


  resource :charge, path: 'mi-equipo' do
    member do
      get 'nuevo-asesor', to: :new_collaborator, as: :new_collaborator
      post 'invitar-asesor', to: :invite_collaborator, as: :invite_collaborator
    end
  end

  get 'mis-proyectos', to: 'projects#my_projects', as: :my_projects

  devise_scope :user do
    put "/confirm" => "users/confirmations#confirm"
  end

  devise_for :users, path: 'usuarios',
    path_names: { sign_in: 'iniciar-sesion', sign_out: 'cerrar-sesion'  },
    controllers: { confirmations: "users/confirmations", 
                   sessions: "users/sessions", 
                   registrations: "users/registrations",
                   omniauth_callbacks: "users/omniauth_callbacks",
                   passwords: "users/passwords" }

  resources :users, path: 'usuarios', path_names: {new: 'nuevo', edit: 'modificar' } do
    member do
      post :disable,     path: 'deshabilitar'
      post :enable,      path: 'habilitar'
    end
  end

end
