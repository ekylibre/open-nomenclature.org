Nomen::Application.routes.draw do

  resources :nomenclatures do
    resources :attributes do
    end
    resources :items do
    end
    member do
      get :tree
    end
  end

  root to: "home#index"
end
