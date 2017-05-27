Rails.application.routes.draw do
  resources :months, only: [:show, :home] do
    resources :tasks, except: [:new]
  end
  get '/months/:month_id/tasks/new/:day' => 'tasks#new', as: :new_month_task
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "months#home"
  #rails s -p $PORT -b $IP
end
