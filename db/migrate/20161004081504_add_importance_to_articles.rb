class AddImportanceToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :importance, :decimal
  end
end
