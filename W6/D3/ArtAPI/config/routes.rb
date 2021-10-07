Rails.application.routes.draw do
  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index]
  end

  resources :artworks, except: [:new, :index, :edit, :index]
  
  resources :artwork_shares, only: [:create, :destroy]
 
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
