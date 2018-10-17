

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
cart.each do |item, attributes|
        if attributes[:clearance] == true
            attributes[:price] = (attributes[:price]*(0.8)).round(2) #takes 20% off the price
        end
    end
    cart
  end


def checkout(cart, coupons)
  # code here
end
