class TestProduct < ApplicationRecord
  belongs_to :myuser

  validates :product_name, :price,  :description, presence: true
  validates :product_name, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :product_name
end
