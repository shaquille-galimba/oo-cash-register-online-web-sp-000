class CashRegister
  attr_accessor :discount, :total, :items


  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = []
  end

  def add_item(item, price, quantity = 1)
    quantity.times do
      self.total += price
      self.items << item
    end
    @last_transaction << price * quantity
  end

  def apply_discount
    if self.discount == nil
      "There is no discount to apply."
    else
      self.total -= self.total * (self.discount.to_f/100)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  #I built this method so that customer could void multiple last transaction
  #I thought this would be a nice way to remove customer mistakes
  #Since we don't have a delete transaction method
  def void_last_transaction
    self.total -= @last_transaction.pop
  end
end
