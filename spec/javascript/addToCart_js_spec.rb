require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'AddToCart' do
  before do 
    # build the instance variables needed by the view
    @products = [
      Product.create!(:title => 'expensive cupcake', :price => 3.99),
      Product.create!(:title => 'cheap cake', :price => 0.29)
    ]
    @cart = Cart.create!
    
    # generate html from actual ERB templates!!!
    @html = view_from( '/products/index.html.erb' )
    
    # Create a Harmony page and load it with our files
    js_dir = File.dirname(__FILE__) + '/../../public/javascripts'
    @page = Harmony::Page.new(@html)
    @page.load(
      js_dir + '/class_inheritance.js',
      js_dir + '/jquery-1.4.2.min.js', 
      js_dir + '/addToCart.js'
    )
    
    @page.execute_js(" 
      // set up the object being tested
    ")     
  end
  
  it 'harmony testing should be setup correctly' do 
    true.should == true
  end
  
  describe 'initialization' do
    it 'should have a single form as the dom'
    it 'should call listen()'
  end
  
  describe 'listen()' do 
    it 'should listen for form submit'
  end
  
  describe 'request()' do
    it 'should make a request to the correct url'
    it 'should make a request with the correct data'
  end 
  
  describe 'success(response)' do
    it 'should remove the existing cart dom'
    it 'should insert the response'
  end   
end
    