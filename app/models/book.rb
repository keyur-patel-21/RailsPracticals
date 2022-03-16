class Book < ApplicationRecord
  belongs_to :author
  has_many :images, as: :imageable, dependent: :destroy
end
