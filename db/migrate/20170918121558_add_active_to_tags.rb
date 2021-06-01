class AddActiveToTags < ActiveRecord::Migration[4.2]
  def change
    add_column :tags, :active, :boolean, default: true
  end
end
