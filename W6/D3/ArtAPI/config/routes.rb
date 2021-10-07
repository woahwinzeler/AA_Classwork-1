Rails.application.routes.draw do
  resources :artworks, except: [:new, :edit]
  resources :artwork_shares, only: [:create, :destroy]
  resources :users, except: [:new, :edit]
  
  #resources route for artwork share
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
