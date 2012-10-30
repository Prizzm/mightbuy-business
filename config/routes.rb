MightbuyBusiness::Application.routes.draw do
  devise_for :business_staffs
  root :to => "welcome#index"
end
