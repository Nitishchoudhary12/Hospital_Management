Rails.application.routes.draw do
  devise_for :hospital_staffs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # namespace :landing_page do
    root "landing_page/homes#index"
  # end
end
