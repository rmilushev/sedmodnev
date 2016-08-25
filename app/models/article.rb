class Article < ActiveRecord::Base
  scope :desc_order, -> { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 3.days.ago) }
  validates :title, :article_image, presence: true
  attachment :article_image
end
