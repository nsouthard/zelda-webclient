Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'zeldas#index'
  get '/zeldas' => 'zeldas#index'
  get '/zeldas/:id' => 'zeldas#show'

end
