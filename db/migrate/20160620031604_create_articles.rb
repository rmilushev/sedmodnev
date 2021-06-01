class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.string :picture
      t.decimal :author_id
      t.decimal :category_id
      t.datetime :golive

      t.timestamps null: false
    end
  end
end
