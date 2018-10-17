

def consolidate_cart(cart)
  # code here
  fullcart = {}
  cart.each do |x|
    x.each do |key, value|
      value[:count] = cart.count(x) 
    end
    fullcart.merge!(x) 
  end
fullcart
end	

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |item|
       if cart.has_key?(item[:item]) && cart[item[:item]][:count] >= item[:num]
       new = item[:item] + " W/COUPON" 
             if cart.has_key?(new)
             cart[new][:count] += 1 
            else
            cart[new] = {price: item[:cost], clearance: cart[item[:item]][:clearance], count: 1} 
            end
        cart[item[:item]][:count] -= item[:num] 
        end
    end
    cart
end	


def apply_clearance(cart)
  # code here
  multiplier = 0.8
  cart.each do |key, value|
        if value[:clearance] == true
            value[:price] = ((value[:price]*multiplier).round(2))
        end
    end
    cart
  end


def checkout(cart, coupons)
  # code here
  #Apply functions to cart
  cart = consolidate_cart(cart)
	cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  multiplier = 0.0
  cart.each do |key, attributes|
        total += attributes[:price] * attributes[:count]
    end
    if total >= 100
        total = (total*0.9).round(2) 
    end
    total
end
