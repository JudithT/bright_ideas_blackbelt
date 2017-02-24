Rails.application.routes.draw do
  get'/main' => 'users#index'
  get '/bright_ideas'=>'users#bright_ideas'
  post '/register' => 'users#register'
  post'/login' => 'users#login'
  post'/create_bright_ideas' => 'users#create_bright_ideas'
  post'/like/:id' => 'users#like'
  post'/unlike/:id' => 'users#unlike'
  get 'users/:id' => 'users#show'
  get 'logout'  => 'users#logout'
  get 'bright_ideas/:id'=> 'users#status'






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
