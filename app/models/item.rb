class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :price
  validates :price, numericality: {greater_than: 0}
end
