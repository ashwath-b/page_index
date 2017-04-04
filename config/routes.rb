Rails.application.routes.draw do
  resources :page_details, except: [:new, :edit]
  root to: 'page_details#index'
end
