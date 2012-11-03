MightbuyBusiness::Application.routes.draw do
  devise_for :business_staffs

  resource :business do
    collection do
      get :complete_profile
    end
  end

  resources :products
  resources :customers

  root :to => "welcome#index"
end
