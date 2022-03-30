class Product < ApplicationRecord
  enum :status, [in_stock : 1, ut, :complete, :cancelled]
  validates :title, :description, :price, :capacity, :is_active, :status, presence: true
  default_scope { where(is_active: "Yes") }
  has_many :orders, dependent: :destroy
end
