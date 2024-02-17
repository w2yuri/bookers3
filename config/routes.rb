Rails.application.routes.draw do
  resources :books, only: [:index, :show, :create, :destroy]
  devise_for :users
  root to: "homes#top", as: :top
  get 'homes/about' => 'homes#about', as: :about
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
