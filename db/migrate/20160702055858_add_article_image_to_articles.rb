class AddArticleImageToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :article_image_id, :string
  end
end
