Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  #   registrations: 'auth/registrations'
  # }
  mount_graphql_devise_for User, at: 'graphql_auth'
  as :user do
    # Define routes for User within this block.
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :messages, only: :index do
    member do
      resources :likes, only: :create
    end
  end

  resources :likes, only: :destroy

  # graphql IDE
  post "/graphql", to: "graphql#execute"
end
