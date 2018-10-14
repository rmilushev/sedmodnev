class CreateArticleImpressions < ActiveRecord::Migration
  def change
    create_table :article_impressions do |t|
      t.integer :article_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
