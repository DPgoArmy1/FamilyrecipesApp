Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/edit'

  resources :recipes do
    resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end