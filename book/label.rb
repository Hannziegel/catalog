require 'securerandom'

class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color, id = SecureRandom.random_number(1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end
end
