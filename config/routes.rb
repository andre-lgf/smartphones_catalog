Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :announcements, only: [:index, :show, :create]

      resources :brands, only: [:index, :show, :create] do
        resources :devices, only: [:index, :show, :create]
      end

      resources :csvs, only: [:index, :show, :create] do
        resources :announcements, only: [:index]
      end

      resources :colors, only: [:index, :show, :create]
      resources :plans, only: [:index, :show, :create]

      resources :devices, only: [:index]
    end
  end

  scope module: :web do
    resources :announcements, only: [:index]

    resources :csvs, only: [:index, :show] do
      collection { post :import }
    end
  end
end

