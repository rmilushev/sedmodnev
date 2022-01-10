class Tag < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true
end
