Rails.application.routes.draw do

  resources :rvs, only: [:show, :index] do 
    resources :trips, only: [:new, :show, :index]
  end


  
  resources :trips, only: [:new, :edit, :index, :show, :create]
  
  devise_for :users, :controllers => { registrations: 'registrations' }, :controllers => {omniauth_callbacks: "callbacks"}
  resources :users do 
    resources :trips, only: [:index]    
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'
end
