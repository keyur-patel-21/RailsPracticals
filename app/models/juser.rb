class Juser < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true
  validate :passauthenticate, on: :update

  def passauthenticate
    user = Juser.find_by_id(self.id)
    if ((self.password != user.password) && (self.email != user.email))
      errors.add(:base, "Password is incorrect.")
    else
      self.password = user.password
    end
  end

end
