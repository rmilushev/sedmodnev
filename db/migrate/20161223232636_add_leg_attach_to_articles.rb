class AddLegAttachToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :leg_attach, :string
  end
end
