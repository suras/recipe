Rails.application.routes.draw do
  
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    
    namespace :v1, defaults:{format: 'json'} do
      
      get '/ingredients_search', to: 'ingredients#ingredients_search'

      get '/workflows_search', to: 'workflows#workflows_search'
      
      # users routes

      post '/create_user', to: 'authentications#create_user'

      get '/user_profile', to: 'users#user_profile'

      match "/users" => 'users#update', via: [:put, :patch]
      
      delete '/users', to: 'users#destroy'

      get '/users', to: 'users#show'

      get '/password_reset', to: 'users#send_password_reset'

      post '/password_reset', to: 'users#reset_password'

      # recipe items
       
      match "/recipe_items" => "recipe_items#update", via: [:put, :patch]

      delete '/recipe_items', to: 'recipe_items#destroy'
      
      get '/recipe_items', to: 'recipe_items#show'

      get '/steps', to: 'steps#show'

      delete '/steps', to: 'steps#destroy'

      match "/steps" => "steps#update", via: [:put, :patch]

      resources :recipe_items
        
      resources :steps
     
      resources :cards
       
      resources :workflows

      resources :ingredients

    end
  
  end
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
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
