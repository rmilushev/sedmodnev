class AddImportanceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :importance, :decimal
  end
end
