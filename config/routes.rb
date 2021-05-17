Rails.application.routes.draw do
  resources :zones
  resources :manuals, only: %i[index create] do
    collection do
      post :random, as: :random
      get :hurt, as: :hurt
    end
  end

  root controller: :zones, action: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
