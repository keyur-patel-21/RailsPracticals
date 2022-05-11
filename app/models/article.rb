class Article < ApplicationRecord
  has_many :acomments, dependent: :destroy 
end
