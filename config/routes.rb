Rails.application.routes.draw do
  root 'boards#index'

  resources :boards do
    put '/move_up', to: 'boards#move_up', as: :move_up
    put '/move_down', to: 'boards#move_down', as: :move_down
    resources :lists do
      put '/move_up', to: 'lists#move_up', as: :move_up
      put '/move_down', to: 'lists#move_down', as: :move_down
    end
  end
  
  scope 'lists/:list_id', as: 'list' do
    resources :tasks, only: [:new, :create, :show, :up, :down] do
      put '/up', to: 'tasks#up', as: :up
      put '/down', to: 'tasks#down', as: :down
    end
  end
end