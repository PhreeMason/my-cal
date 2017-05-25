Rails.application.routes.draw do
  resources :months, only: [:show, :home] do
    resources :tasks
  end
  post '/months/jump' => 'month#jump', as: :jump
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "months#home"
  #rails s -p $PORT -b $IP
end
