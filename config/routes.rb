Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :followers
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'home#front'
  end

  post 'new_preview', to: 'posts#new_preview', as: 'new_preview'

  match :follow,    to: 'follows#create',   as: :follow, via: :post
  match :unfollow,  to: 'follows#destroy',  as: :unfollow, via: :post

  # match :flykke,    to: 'likes#flykke',     as: :flykke, via: :put
  # match :upvote,    to: 'likes#upvote',     as: :upvote, via: :put
  # match :downvote,  to: 'likes#downvote',   as: :downvote, via: :put

  put 'posts/:id/upvote' => 'likes#upvote', as: :upvote
  put 'posts/:id/downvote' => 'likes#downvote', as: :downvote
  put 'posts/:id/flykke' => 'likes#flykke', as: :flykke

  # member do
  #     put "upvote",   to: "posts#upvote"
  #     put "downvote", to: "posts#downvote"
  #     put "flykke",   to: "posts#flykke"
  #   end

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
  #     #     resources :sales do
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
