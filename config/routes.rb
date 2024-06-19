Rails.application.routes.draw do
  get 'admin/:ressource', to: 'admin_dashboard#index'
  get 'my_profile', to: 'user_dashboard#show'
  
  post 'contact',  to: 'static_pages#send_contact_email'

  resources :products
  resource :cart, only: :show
  resources :cart_items, only: [:create, :update, :destroy]
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               passwords: 'users/passwords'
             },
            #  'users' => 'users/registrations',
             defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "products#index"
end
