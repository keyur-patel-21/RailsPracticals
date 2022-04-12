class Event < ApplicationRecord

  belongs_to :category
  belongs_to :user

  has_many :enrollments
  validates :name, presence: true,
                  length: { minimum: 3, maximum: 100 }
  validates :description, presence: true,
                  length: { minimum: 10, maximum: 500}
end
