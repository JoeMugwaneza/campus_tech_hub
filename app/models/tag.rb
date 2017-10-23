class Tag < ApplicationRecord

  # for tags 
  has_many :taggings
  has_many :questions, through: :taggings
end
