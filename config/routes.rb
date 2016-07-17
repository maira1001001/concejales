Rails.application.routes.draw do

  root 'projects#index'

  resources :projects, path: 'proyectos',
    path_names: { new: 'nuevo', edit: 'editar' }

  get   'mi-equipo/nuevo-asesor',   to: 'users#new_collaborator',  as: :new_collaborator

  get 'mis-proyectos', to: 'projects#my_projects', as: :my_projects

  devise_scope :user do
    put 'confirmar', to: 'users/confirmations#confirm', as: :confirm
    post 'usuarios/reenviar-email', to: 'users/confirmations#resend_confirmation', as: :user_resend_confirmation
    post 'mi-equipo/invitar-asesor', to: 'users/confirmations#invite_collaborator', as: :invite_collaborator
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

    resource :participation, path: 'periodo-actividad'

end
