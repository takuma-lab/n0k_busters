Rails.application.routes.draw do
  resources :voices
  resources :logs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  get "voices/logs" => "voices#logs"
  get "/nkoku" => "nkoku#index"
  get "/nkoku/phrases" => "nkoku#phrases"
end
