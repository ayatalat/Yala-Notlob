Rails.application.routes.draw do

  devise_for :users
  resources :users do 
  	resources :groups
  
  end
 # get 'add_friend' => 'users/show/add_friend'
 get 'add_friend' =>'users#add_friend'
 root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
