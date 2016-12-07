Rails.application.routes.draw do
  root 'github_users#index'

  post '/search', to: 'github_users#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
