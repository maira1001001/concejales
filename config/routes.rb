Rails.application.routes.draw do

  root 'users#index'

  get 'nuevo-asesor',           to: 'participations#new_collaborator',  as: :new_collaborator
  get 'asesores',               to: 'participations#my_collaborators',  as: :my_collaborators
  get 'mis-proyectos',          to: 'projects#my_projects',             as: :my_projects
  get 'perfil',                 to: 'users#my_profile',                 as: :my_profile
  put 'actualizar-perfil-asesor',to: 'users#update_profile_collaborator', as: :update_profile_collaborator
  put 'actualizar-perfil-concejal',to: 'users#update_profile_councilor',as: :update_profile_councilor
  get 'password',               to: 'users#change_password',            as: :change_password
  put 'actualizar-password',    to: 'users#update_password',            as: :update_password

  devise_scope :user do
    put 'confirmar', to: 'users/confirmations#confirm', as: :confirm
    post 'usuarios/:id/reenviar-email', to: 'users/confirmations#resend_invitation', as: :user_resend_invitation
    post 'invitar-asesor', to: 'users/confirmations#invite_collaborator', as: :invite_collaborator
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

  resources :participations, path: 'periodo-actividad', path_names: { new: 'nuevo' }

  resources :projects, path: 'proyectos', path_names: { new: 'nuevo', edit: 'editar' } do
    member do
      post :not_visible, path: 'no-visible'
      post :visible,     path: 'visible'
      get :download,    path: 'descargar'
    end
  end

end
