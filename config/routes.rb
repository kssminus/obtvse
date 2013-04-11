Obtvse::Application.routes.draw do
  resources :posts
  get     '/admin',     :to => 'posts#admin'
  get     '/new',       :to => 'posts#new'
  get     '/edit/:id',  :to => 'posts#edit'
  post    '/preview',   :to => 'posts#preview'
  get     '/:slug',     :to => 'posts#show', :as => 'post'
  put     '/:slug',     :to => 'posts#update', :as  => 'post'
  patch   '/:slug',     :to => 'posts#update', :as  => 'post'
  delete  '/:slug',     :to => 'posts#destroy', :as  => 'post'
  
 
  get '/categories/index'     => 'categories#index'
  get '/categories/:category' => 'categories#list', :as => 'category_list'

  get  '/chat/index' => 'chat#index'
  post '/chat/message' => 'chat#message'
  get  '/chat/chatroom' => 'chat#chatroom' 

  root :to => 'posts#index'
end
