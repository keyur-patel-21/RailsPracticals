class Employeen < ApplicationRecord
  
  has_many :eaddresses
  accepts_nested_attributes_for :eaddresses
end
