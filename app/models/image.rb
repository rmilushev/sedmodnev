class Image < ApplicationRecord
  belongs_to :article
  belongs_to :user
  # attachment :picture
  has_one_attached :picture
  scope :desc_order, -> { order('created_at DESC') }
end
