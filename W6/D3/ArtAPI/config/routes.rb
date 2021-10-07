Rails.application.routes.draw do
  get 'artworks_controller/index'
  get 'artworks_controller/show'
  get 'artworks_controller/update'
  get 'artworks_controller/destroy'
  get 'artworks_controller/create'
  resource :user, except: [:new, :edit]
  
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
