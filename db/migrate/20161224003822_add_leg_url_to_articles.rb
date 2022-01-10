class AddLegUrlToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :leg_url, :string
  end
end
