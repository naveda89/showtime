Rails.application.routes.draw do
  devise_for :users

  # Pagination concern
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end

  # REST API endpoints
  namespace :api, defaults: {format: 'json'} do
    # Versioned API
    namespace :v1 do

      ## CONTENTS
      resources :contents,  only: [:index, :show], concerns: :paginatable
      resources :movies,    only: [:index, :show], concerns: :paginatable, defaults: { by_type: 'Movie' },  controller: :contents
      resources :seasons,   only: [:index, :show], concerns: :paginatable, defaults: { by_type: 'Season' }, controller: :contents do
        resources :episodes, only: [:show]
      end

      ## PURCHASES
      resources :purchases, only: [:index, :show], concerns: :paginatable
      resources :content_purchase_options, only: [] do
        resource :purchase, only: [:create]
      end

    end
  end

  # Welcome (entry point)
  root 'welcome#index'

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
