Rails.application.routes.draw do
  resources :item_variants
  resources :variants
  resources :orders
  resources :options
  # Ressources pour les commentaires
  resources :comments, only: [:index, :show]

  # Route pour l'admin dashboard
  get 'admin/:ressource', to: 'admin_dashboard#index'

  # Route pour le profil utilisateur
  get 'my_profile', to: 'user_dashboard#show'

  # Route pour le formulaire de contact
  post 'contact',  to: 'static_pages#send_contact_email'

  # Ressources pour les produits, incluant les commentaires imbriqués
  resources :products do
    resources :comments, only: [:create, :update, :destroy, :index]
  end

  resources :comments, only: [:index, :show, :update, :destroy]

  # Ressource pour le panier
  resource :cart, only: [:show, :update]

  # Ressources pour les éléments du panier
  resources :cart_items, only: [:create, :update, :destroy]

  # Routes pour Devise avec des contrôleurs personnalisés
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }, defaults: { format: :json }

  devise_scope :user do
    delete 'sign_out', to: 'users/sessions#destroy'
  end

  # Ressources pour les utilisateurs, incluant les commentaires imbriqués
  resources :users do
    resources :comments, only: [:index]
  end

  # Route pour vérifier l'état de santé de l'application
  get "up" => "rails/health#show", as: :rails_health_check
  get 'current_user', to: 'users#current'
  get 'admin_check', to: 'users#check_admin'

  # Définir la route racine
  # root "products#index"
end
