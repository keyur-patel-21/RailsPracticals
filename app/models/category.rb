class Category < ApplicationRecord

  belongs_to :event

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 3, maximum: 25}

end