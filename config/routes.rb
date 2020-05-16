Rails.application.routes.draw do
  root to: "home#index"
  get '/managements', to: 'managements#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :admins,  controllers: {
    sessions: 'admins/sessions'
  }
end
