Rails.application.routes.draw do
  root 'chat_gpt#index'
  post 'ask', to: 'chat_gpt#ask'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
