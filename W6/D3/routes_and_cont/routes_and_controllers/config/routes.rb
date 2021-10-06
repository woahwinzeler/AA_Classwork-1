Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users 

  #equivlant to resources :users
  get "/users", to: "users#index"
  post "/users", to: "users#create"
  get "/users/new", to: "users#new", as: "new_user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  get "/users/:id", to: "users#show", as: "user"
  patch "/users/:id", to: "users#edit"
  put "/users/:id", to: "users#edit"
  delete "/users/:id", to: "users#destroy"



end
