class Article < ActiveRecord::Base
  validates :title, presence: true
  attachment :article_image
end
