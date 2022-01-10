class CreateAuthorProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :author_profiles do |t|
      t.references :admin, foreign_key: true
      t.string :name
      t.string :image
      t.text :description
      t.boolean :enabled

      t.timestamps
    end
  end
end
