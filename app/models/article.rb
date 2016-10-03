class Article < ActiveRecord::Base
  scope :desc_order, -> { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 3.days.ago) }
  scope :on_top, -> { where(on_top: true) }
  validates :title, :article_image, presence: true
  attachment :article_image

  def on_top?
    on_top
  end
end
