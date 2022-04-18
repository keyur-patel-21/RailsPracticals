class Comment < ApplicationRecord

  #associations
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
