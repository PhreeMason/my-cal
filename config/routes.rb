Rails.application.routes.draw do
  resources :months, only: [:show, :home] do
    resources :tasks, except: [:new]
  end
  get 'months/:id/prev' => 'month#prev_month', as: :prev_month
  get '/months/:id/next' => 'month#next_month', as: :next_month
  get '/months/:month_id/day/:day/more' => 'tasks#more', as: :more_task_day
  get '/upcoming' => 'tasks#upcoming', as: :upcoming
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root "months#home"
  get '/overdue' => 'tasks#old_news', as: :overdue
  #rails s -p $PORT -b $IP
end
# <a href="#" class="js-next" data-id="<%=@post.id%>">Next...</a>
# <%= link_to 'Next Month', (@month.next_month), id: 'next-month' %>