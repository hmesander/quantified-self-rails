Rails.application.routes.draw do
  get '/', to: 'welcome_page#welcome'

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show, :create, :update, :destroy]
      resources :meals, only: [:index]
      get 'meals/:id/foods', to: 'meals#show'
    end
  end
end
