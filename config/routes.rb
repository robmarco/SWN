SWN::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :accounts, :except => [:new, :show, :index]
  resources :trainnings, :path => "entrenamientos"  
  resources :incidents, :path => "incidencias", :except => [:show]  
  resources :trials, :path => "tests"
  resources :competitions, :path => "competiciones"
  resources :swimmers, :path => "nadadores" do 
    member do
      delete 'delete_photo', :path => "eliminar_foto"
    end
  end

  get "dashboard/index", :as => :dashboard
  get "pages/index"
  get "pages/about"
  
  devise_for :users
  root :to => "pages#index"

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
