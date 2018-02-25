class Image < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  attachment :picture
  scope :desc_order, -> { order('created_at DESC') }
end
