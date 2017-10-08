Rails.application.routes.draw do

  get 'landing/index'

  root to: 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'data', to: redirect('/data.csv')

  get '/currencies', to: 'currencies#index'
end
