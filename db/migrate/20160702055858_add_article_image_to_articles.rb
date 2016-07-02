class AddArticleImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_image_id, :string
  end
end
