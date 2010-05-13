var AddToCart = Class.extend({
  init : function(html){
    this.dom = $(html);
    this.listen();
  },
  
  listen : function(){
    var self = this;
    this.dom.bind( 'submit', function(){
      self.request();
      return false
    });
  },
  
  request : function(){
    $.post(
       this.dom.attr('action'),
       this.dom.serialize(),
       this.success
     );
  },
  
  success : function(response){
    $('div.cart').replaceWith(response);
  }
});

AddToCart.selector = 'form.ajax_form'
AddToCart.cart_selector = 'div.cart'