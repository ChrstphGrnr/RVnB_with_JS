Rails.application.routes.draw do

  resources :rvs, only: [:show, :index] do 
    resources :trips, only: [:new, :show, :index]
  end


  resources :trips, only: [:show, :create, :edit, :new, :delete, :update]
  
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "callbacks" }
  resources :users do 
    resources :trips  
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'

  get '/sort_by_price', to: 'rvs#sort_by_price', as: '/sort_by_price'
  
end
