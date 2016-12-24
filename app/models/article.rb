class Article < ActiveRecord::Base
  validates :title, presence: true
  attachment :article_image
  acts_as_taggable

  scope :desc_order, -> { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 5.days.ago) }
  scope :importance, -> { order('importance ASC') }
end
