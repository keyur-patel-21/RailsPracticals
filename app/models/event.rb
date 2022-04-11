class Event < ApplicationRecord

  has_one :category
  belongs_to :user
  validates :name, presence: true,
                  length: { minimum: 3, maximum: 100 }
  validates :description, presence: true,
                  length: { minimum: 10, maximum: 500}
end
