class TestProduct < ApplicationRecord
  belongs_to :myuser

  validates :product_name, :price,  :description, presence: true
end
