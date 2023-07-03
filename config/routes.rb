Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'
  devise_for :user_with_2_auths
end
