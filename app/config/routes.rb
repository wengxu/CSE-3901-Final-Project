Rails.application.routes.draw do
  get 'search/index'

  get 'search/search'

  get 'search/searchResult'

  get 'login'     => 'sessions#new'

  post 'login'    => 'sessions#create'

  delete 'logout'  => 'sessions#destroy'

  resources :free_times

  

  resources :users


  resources :groups

  get 'group/index'

  get 'group/create'

  get 'group/new'

  get 'group/edit'

  get 'group/update'

  get 'group/destroy'


  resources :students

  get 'student/index'

  get 'student/create'

  get 'student/new'

  get 'student/edit'

  get 'student/update'

  get 'student/destroy'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'search#index', as: 'search'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
