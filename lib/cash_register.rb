require 'pry'

class CashRegister

attr_accessor :total, :cart, :all_prices
attr_reader :cash_register, :discount

def initialize (discount=0)
    @total = 0
    @discount = discount
    @cart = []
    @all_prices = []
end 

def add_item(title, price, quantity=1)
    @total += price * quantity
    if quantity >= 1 && price > 0
    quantity.times {@cart << title} 
    @all_prices << quantity * price
    end
end

def apply_discount
    if @discount > 0
        @total -= @total * @discount/100
        return "After the discount, the total comes to $#{@total}."
    else 
        return "There is no discount to apply."
    end
end 

def items
    return @cart 
end 

def void_last_transaction
    @total -= @all_prices.last
end 

end