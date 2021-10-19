Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controller#action'
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'
end
