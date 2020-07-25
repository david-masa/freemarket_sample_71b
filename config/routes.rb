Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'users/new_addresses', to: 'users/registrations#new_address'
    
    post 'addresses', to: 'users/registrations#create_address'
  end



  root 'top#index'	
  resources :top, only: [:new, :create, :show, :edit, :update, :destroy]
  
  resources :posts, only: [:index, :edit]

  resources :newreg, only: :index

  resources :log, only: :index

  resources :items do
    collection do
      get 'get_parent', defaults: { format: 'json' }
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end

  

  resources :users, only: :index

  resources :logout, only: :index

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
    end
  end  

end