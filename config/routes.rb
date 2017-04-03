Rails.application.routes.draw do

  devise_for :users
  resources :users do 
  	resources :groups

  
  end
  resources :friends
put 'friends/:id/accept' => 'friends#accept'
delete 'friends/:id/remove' => 'friends#remove'
delete 'friends/:id/decline' => 'friends#decline'

 root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
