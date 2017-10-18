Rails.application.routes.draw do
root to: 'jobs#index'
# DON'T FORGET TO SET ONLY AND EXCEPT FOR CERTAIN NESTED ONES

  resources :companies do
    resources :jobs
    resources :contacts
  end

  resources :jobs do
    resources :comments, only: [:create]
  end

  resources :categories
  resources :dashboards


end
