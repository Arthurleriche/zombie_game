Rails.application.routes.draw do
  root 'pages#show'
   namespace :api do
    namespace :v1 do
      resources :users
    end
  end
     get '*path' => "pages#show"
end
