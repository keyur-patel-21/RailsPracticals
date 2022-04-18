class Enrollment < ApplicationRecord

  #association
  belongs_to :user
  belongs_to :event
end
