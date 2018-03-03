Rails.application.routes.draw do
  get 'users/index'

  get 'users/login'

  post 'users/register'

  post 'users/profile'

  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
