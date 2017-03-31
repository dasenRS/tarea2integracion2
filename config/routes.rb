Rails.application.routes.draw do
  get'usuario/:id', to: 'usuarios#show'
  get'usuario', to: 'usuarios#index'
  put'usuario', to: 'usuarios#create'
  delete'usuario/:id', to: 'usuarios#destroy'
  post'usuario/:id', to: 'usuarios#update'
end
