Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    resources :entries do
      resources :comments do
        member do
          put :approve
        end
      end
    end
  end
end
