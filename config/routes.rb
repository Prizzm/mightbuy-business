MightbuyBusiness::Application.routes.draw do
  devise_for :business_staffs, controllers: {
    registrations: 'registrations'
  }

  resource :business do
    collection do
      get :complete_profile
      get :profile
      put :update_profile
    end
    resources :business_staffs, module: "business"
  end

  resources :products do
    resource :deal
  end

  resources :topics

  resources :timeline
  resources :customers
  resources :leads

  resource  :retail
  resources :retail_leads do
    get 'photo', on: :member
  end
  resource  :lead_config, only: [:edit, :update]

  root :to => "welcome#index"
end
