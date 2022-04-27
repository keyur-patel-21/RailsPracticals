class Myorder < ApplicationRecord

  validates :myproduct_id, :quanity, presence: true

  belongs_to :myproduct
end
