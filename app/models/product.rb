class Product < ApplicationRecord

  validates :title, :description, :price, :capacity, :is_active, :status, presence: true
  default_scope { where(is_active: "Yes") }
  has_many :orders, dependent: :destroy
end
