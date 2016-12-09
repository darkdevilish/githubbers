Rails.application.routes.draw do
  root 'github_users#index'

  post '/search', to: 'github_users#search'
  get '/prev', to: 'github_users#prev'
  get '/next', to: 'github_users#next'
  get 'page', to: 'github_users#page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
