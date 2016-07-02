class Article < ActiveRecord::Base
  validates :title, :content, presence: true
  attachment :article_image
end
