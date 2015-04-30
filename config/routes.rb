Shopcart::Application.routes.draw do
  get "homepage/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # ,:as=>'shop_list'
  # You can have the root of your site routed with "root"
   root 'homepage#index'
  get "/homepage/shop_list" => 'homepage#shop_list' ,:as => 'shop_list'
  get "/homepage/shopping_cart" => 'homepage#shopping_cart'
  get "/homepage/pay_list" => 'homepage#pay_list'
  post "/homepage/pay_list" => 'homepage#clear_goods'
  # get  "/homepage/add_cart"
  get "/get_cart_number" => 'homepage#get_cart_num'
  post "/homepage/shopping_cart" => 'homepage#free_list'
  get "/reduce_good" => 'homepage#get_carts_number'
  get "/homepage/reduce_goods" => 'homepage#reduce_goods'
  get "/homepage/add_goods"
  get "/homepage/clear_goods"
  # post "get_cart_number" => 'homepage#get_cart_num'
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
