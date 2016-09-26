Rails.application.routes.draw do

  get 'manageride/index'

  get 'manageride/view'

  get 'manageride/edit'

  devise_for :adminusers
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root to: "ride#index"
    devise_for :users , controllers: { registrations: "registrations",omniauth_callback: "omniauth_callback",}
                        # controllers: { omniauth_callback: "omniauth_callback" }

    devise_scope :user do
       get "sign_out", :to => "devise/sessions#destroy"
       get "sign_in", :to => "devise/sessions#new"
    end
    match ':controller(/:action(/:id))', :via=>[:get,:post]


  resources :conversation do
    resources :messages
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
