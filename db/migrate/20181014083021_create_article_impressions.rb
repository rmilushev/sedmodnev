class CreateArticleImpressions < ActiveRecord::Migration[4.2]
  def change
    create_table :article_impressions do |t|
      t.integer :article_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
