MightbuyBusiness::Application.routes.draw do
  devise_for :business_staffs
  resources :businesses
  root :to => "welcome#index"
end
