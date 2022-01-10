class AddLegAttachToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :leg_attach, :string
  end
end
