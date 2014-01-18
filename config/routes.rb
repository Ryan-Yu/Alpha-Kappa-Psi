AlphaKappaPsi::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :actives, :path_prefix => 'alt'
  resources :actives, only: [:index, :show] do
    resources :career_entries
  end

  resources :rushees, only: [:index, :show, :new, :create] do
    resources :rusheeposts, only: [:create, :destroy]
  end

  root     'static_pages#home'
  match    '/about',        to: 'static_pages#about',      via: 'get'
  match    '/careers',      to: 'static_pages#careers',    via: 'get'
  match    '/contact',      to: 'static_pages#contact',    via: 'get'
  match    '/consulting',   to: 'static_pages#consulting', via: 'get'
  match    '/corporate',    to: 'static_pages#corporate',  via: 'get'
  match    '/rush',         to: 'static_pages#rush',       via: 'get'
  match    '/classes',      to: 'static_pages#classes',    via: 'get'
  match    '/contact',      to: 'static_pages#contact_request',     via: 'post'

  # Handles GET /rush_application -- controller: rush_application | method: INDEX
  # Handles GET /rush_application/:id -- controller: rush_application | method: SHOW
  resources :rush_application, only: [:index, :show] do
    member do
      # Handles POST/GET /rush_application/print -- controller: rush_application | method: PRINT
      post 'print'
      get 'print'
    end
  end

  #Handles POST /rush_application/landing -- controller: rush_application | method :LANDING
  match    '/rush_application/landing',      to: 'rush_application#landing',     via: [:post], as: :landing_rush_application

  # Handles GET/POST /rush_application/new -- controller: rush_application | method: NEW
  # Paths created: new_rush_application_path | new_rush_application_url
  match    '/rush_application/new',          to: 'rush_application#new',     via: [:post, :get], as: :new_rush_application

  # Handles POST/PATCH /rush_application/submit -- controller: rush_application | method: CREATE
  # Paths created: submit_rush_application_path | submit_rush_application_url
  match    '/rush_application/submit',       to: 'rush_application#create',     via: [:patch, :post], as: :submit_rush_application

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
