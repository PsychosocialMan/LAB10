Rails.application.routes.draw do
  root 'polindrom#input'
  
  get '/output' => 'polindrom#output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
