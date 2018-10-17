

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
  newprice = 0;
  cart.each do |item, value|
        newprice == value[:price]
        if value[:clearance] == true
            value[:price] = (newprice.round(2))
        end
    end
    cart
end


def checkout(cart, coupons)
  # code here
end
