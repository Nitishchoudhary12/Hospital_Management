Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "landing_page/homes#index"

  devise_for :hospital_staffs

  namespace :handle_patient_detail do
    resources :patients
  end

end
