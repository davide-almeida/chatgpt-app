Rails.application.routes.draw do
  root 'pages#home'
  post 'ai_request', to: 'pages#ai_request'
end
