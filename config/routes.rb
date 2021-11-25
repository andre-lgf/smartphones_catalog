Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :brands, only: [:index, :show, :create] do
        resources :devices, only: [:index, :show, :create]
      end

      resources :colors, only: [:index, :show, :create]
      resources :plans, only: [:index, :show, :create]
      resources :csvs, only: [:index, :show, :create]

      get "/devices" => "devices#list"
    end
  end
end

