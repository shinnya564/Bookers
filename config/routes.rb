Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'books#top'
  resources :books, only: [:edit, :update , :show, :destroy, :index, :create]

end
