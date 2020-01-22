Rails.application.routes.draw do
  resources :voice_data
  resources :busters
  resources :logs
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'buster/index'
  
  get "/nkoku" => "nkoku#index"
  get "/nkoku/phrases" => "nkoku#phrases"
end
