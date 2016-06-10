Rails.application.routes.draw do

  root to: 'books#index'

  resources :books do 
    resources :articles do
      resources :sections do
        resources :comments
      end
    end          
  end

end
