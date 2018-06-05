Rails.application.routes.draw do
  root 'boards#index'

  resources :boards do
    put '/move_up', to: 'boards#move_up', as: :move_up
    put '/move_down', to: 'boards#move_down', as: :move_down
    resources :lists
  end

end