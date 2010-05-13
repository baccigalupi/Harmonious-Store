ActionController::Routing::Routes.draw do |map|
  map.resources :cart_line_items
  map.resources :carts
  map.resources :products 
  
  map.root :controller => "products", :action => 'index'
end
