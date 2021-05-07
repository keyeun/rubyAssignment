class Product
  attr_reader :name

  def initialize(name:)
    @name = name
  end
end

class Inventory
  attr_reader :products

  PRODUCT_LIST = [
    {
      :product => Product.new(name: 'Coca Cola'),
      :quantity => 5,
      :code => '1'
    },
    {
      :product => Product.new(name: 'Sprite'),
      :quantity => 5,
      :code => '2'
    },
    {
      :product => Product.new(name: 'Fanta'),
      :quantity => 5,
      :code => '3'
    },
    {
      :product => Product.new(name: 'Orange Juice'),
      :quantity => 5,
      :code => '4'
    }
  ]
  def product_listing
  PRODUCT_LIST.map do |item|
    item[:quantity] = products[item[:code]].length
    item
  end
  end
end

class vending
  def initialize
    @inventory = Inventory.new
  end
  def order
    product_list = inventory.product_listing
    self.item_selected = display.product_options(list: product_list)
    return if item_selected.nil?
    if inventory.product_unavailable?(code: item_selected[:code])
      account.add_transaction(item: item_selected, type: :no_product)
      display.product_unavailable
      reset
    end
  end
