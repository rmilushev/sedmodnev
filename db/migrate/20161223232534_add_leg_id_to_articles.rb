class AddLegIdToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :leg_id, :decimal
  end
end
