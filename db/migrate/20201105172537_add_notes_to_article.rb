class AddNotesToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :notes, :text
  end
end
