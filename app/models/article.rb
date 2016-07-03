class Article < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  validates :title, presence: true
  attachment :article_image
end
