Rails.application.routes.draw do
  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :comments, only: [:create, :destroy]

  resources :artworks, except: [:new, :index, :edit, :index] do
    resources :comments, only: [:index]
  end
  
  resources :artwork_shares, only: [:create, :destroy]
 
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
