class Article < ActiveRecord::Base
  validates :title, :content, presence: true
  mount_uploader :picture, ArticleUploader
end
