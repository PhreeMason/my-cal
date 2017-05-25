Rails.application.routes.draw do
  resources :months
  resources :tasks
  get 'calendars/show'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "months#home"
  #rails s -p $PORT -b $IP
end
