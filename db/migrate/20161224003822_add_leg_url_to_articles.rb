class AddLegUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :leg_url, :string
  end
end
