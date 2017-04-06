Rails.application.routes.draw do


  
 
  devise_for :users
  resources :users do
  	resources :groups
  end

  resources :users do
  	resources :orders
  end
# /users/5/group/1/friends
get 'users/:id/group/:id/friends' => 'groups#friends'
post '/add_friend' =>'groups#add_friend'
post '/list_member' =>'groups#list_member'

  resources :friends
put 'friends/:id/accept' => 'friends#accept'
delete 'friends/:id/remove' => 'friends#remove'
delete 'friends/:id/decline' => 'friends#decline'

post '/order/:id' => 'orders#finish'

 root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
