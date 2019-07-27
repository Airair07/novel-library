Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create]do
    member do
      get :likes
    end
  end
  
  get 'novel-write', to: 'novels#new'
  resources :novels, only: [:show, :update, :edit, :create, :destroy] do
    member do
      get 'episode-write', to: 'episodes#new'
      resources :episodes, only: [:create]
    end
    collection do
      resources :episodes, only: [:show, :destroy, :update, :edit]
    end
  end
  
  resources :favorites, only: [:create, :destroy]
  
end
