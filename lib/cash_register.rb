require 'pry'

class CashRegister
    attr_accessor :total, :discount, :names, :item_quantity, :last_transaction
    
    @@all = []

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @names = []
        @item_quantity = 0
        @last_transaction = 0
        @@all << self
    end

    def self.all
        @@all
    end

    def total
        @total
    end

    def discount
        @discount
    end

    def add_item (title, price, quantity = 1)
        quantity.times do 
            self.items.push(title)
        end
        self.total += price * quantity 
        self.last_transaction = price * quantity
    end

    def apply_discount
        if self.discount > 0
            discount = self.discount/100.to_f
            self.total = self.total - (self.total * (discount))
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        self.names
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
        
end

# binding.pry


# register1 = CashRegister.new(20)
# register1.add_item("eggs", 1, 3)
# register1.add_item("bread", 3)
# register1.add_item("fruit", 1, 4)

