class CartController < ApplicationController
  
  def index

      @cart = session[:cart] || {}

  end
  
  def add
    # get the Id of the product
    id = params[:id]
    
   # if the cart is already been created, use existing cart else create a blank cart
  if session[:cart] then
    cart = session[:cart]
  else
    session[:cart] = {}
    cart = session[:cart]
  end
  #If the product is already added it increments by 1 else product set to 1
  if cart[id] then
    cart[id] = cart[id] + 1
  else
    cart[id]= 1
  end  

    redirect_to :action => :index
  
  end
  
  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end
  

  
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :action => :index
  
  end
  
  def createOrder
    
    @user = User.find(current_user.id)
    
    @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
    
    @order.save
    
    @cart = session[:cart] || {} # collect all cart
    
    @cart.each do | id, quantity |
      
      item = Item.find_by_id(id)
      
      @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => item.quantity, :price => item.price)
      
      @orderitem.save
      
    end
    
    redirect_to '/orderConfirmed/'
    
  end
    
end