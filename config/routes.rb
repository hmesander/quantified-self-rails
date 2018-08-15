Rails.application.routes.draw do
  get '/', to: 'welcome_page#welcome'

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show, :create]
      patch 'foods/:id', to: 'foods#update'
    end
  end
end
