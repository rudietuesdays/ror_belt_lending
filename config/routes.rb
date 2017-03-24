Rails.application.routes.draw do

  root to: 'sessions#index'

  get '/register' => 'sessions#index'
  post '/lenders/create'
  post 'borrowers/create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#new'
  post '/sessions/create'

  get '/lenders/:id' => 'lenders#show'
  patch '/lenders/:id' => 'lenders#lend'

  get '/borrowers/:id' => 'borrowers#show'

  post 'loans/:id' => 'loans#create'

  delete '/logout/:id' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
