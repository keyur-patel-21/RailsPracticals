class Event < ApplicationRecord

  before_save { self.email = email.downcase}
  belongs_to :user
  validates :name, presence: true,
                  length: { minimum: 3, maximum: 100 }
  validates :description, presence: true,
                  length: { minimum: 10, maximum: 500}
end
