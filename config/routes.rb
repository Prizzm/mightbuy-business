MightbuyBusiness::Application.routes.draw do
  devise_for :business_staffs

  resource :business do
    collection do
      get :complete_profile
      get :profile
      put :update_profile
    end
  end

  resources :products do
    resources :deals, only: :create
  end

  resources :customers
  resources :leads

  root :to => "welcome#index"
end
