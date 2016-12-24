class AddLegIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :leg_id, :decimal
  end
end
