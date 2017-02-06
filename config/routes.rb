Nomen::Application.routes.draw do
  filter :locale

  resources :nomenclatures do
    resources :attributes do
    end
    resources :items do
    end
    member do
      get :tree
    end
  end

  root to: 'nomenclatures#index'
end
