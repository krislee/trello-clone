<<<<<<< HEAD
Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"



end
=======
Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  resources :boards do
    resources :lists do
    end
  end
end
>>>>>>> b75aa1a78fdc89ee79e42e7d41bbbf886b80bc11
