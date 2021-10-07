Rails.application.routes.draw do
  resources :artworks, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
