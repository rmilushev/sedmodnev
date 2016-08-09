class Article < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 3.days.ago) }
  validates :title, presence: true
  attachment :article_image
end
