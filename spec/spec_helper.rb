# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/autorun'
require 'spec/rails'

require 'action_view'

require 'harmony'

Spec::Runner.configure do |config| 
  include ActionView::Helpers 
  
  config.before do
    # cleanup the database
    Product.delete_all
    Cart.delete_all
    CartLineItem.delete_all
  end
end 

# Helper stuff
JS_DIR =    File.dirname(__FILE__) + '/../public/javascripts'    
VIEW_DIR =  File.dirname(__FILE__) + '/../app/views' 

# generate html from actual ERB templates!!!
def view_from(path) 
  ERB.new(File.new(VIEW_DIR + path).read).result(binding)
end 