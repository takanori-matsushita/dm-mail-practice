Rails.application.routes.draw do
  resources :direct_mails
  post '/direct_mails/send/:id', to: 'direct_mails#mail_send'
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
