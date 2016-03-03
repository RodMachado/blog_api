Rails.application.routes.draw do
  namespace(
    :api,
    defaults: { format: :json },
    constraints: { subdomain: 'api' },
    path: '/'
  ) do

  end

  resources :comments
  resources :posts
end
