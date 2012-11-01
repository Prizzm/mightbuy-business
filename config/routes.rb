MightbuyBusiness::Application.routes.draw do
  devise_for :business_staffs
  resources :businesses do
    collection do
      get :foo
    end
  end
  root :to => "welcome#index"
end
