class Article < ActiveRecord::Base
  validates :title, :article_image, presence: true
  attachment :article_image

  scope :desc_order, -> { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 5.days.ago) }
  scope :importance, -> { order('importance ASC') }
end
