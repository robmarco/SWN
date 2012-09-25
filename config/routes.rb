SWN::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  get "ajax/swimmers"

  resources :accounts, :except => [:new, :show, :index]
  resources :trainnings, :path => "entrenamientos"  
  resources :incidents, :path => "incidencias", :except => [:show]  
  resources :trials, :path => "tests"
  resources :competitions, :path => "competiciones"
  resources :swimmers, :path => "nadadores" do 
    member do
      delete 'delete_photo', :path => "eliminar_foto"
      post 'send_message_private', :path => "enviar_mensaje"      
    end

    collection do
      get 'send_message', :path => "enviar_mensajes"
      post 'send_message_post', :path => "enviar_mensajes"
    end
  end

  get "dashboard/index", :as => :dashboard
  get "pages/index"
  get "pages/about"
  
  devise_for :users
  root :to => "pages#index"

end
