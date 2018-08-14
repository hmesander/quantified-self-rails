Rails.application.routes.draw do
  get '/', to: 'welcome_page#welcome'

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
