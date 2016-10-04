class Article < ActiveRecord::Base
  validates :title, :article_image, presence: true
  attachment :article_image

  scope :desc_order, -> { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 10.days.ago) }
  scope :importance, -> { order('importance DESC') }
end
