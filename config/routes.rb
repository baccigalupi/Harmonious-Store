ActionController::Routing::Routes.draw do |map|
  map.resources :carts do |product|
    product.resources :cart_line_items, :as => 'items'
  end
  map.resources :products 
  
  map.root :controller => "products", :action => 'index'
end
