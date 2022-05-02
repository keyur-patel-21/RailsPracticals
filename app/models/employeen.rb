class Employeen < ApplicationRecord
  
  has_many :eaddresses, dependent: :destroy
  accepts_nested_attributes_for :eaddresses
end
