class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :genre, null: false
      t.integer :owner_id
      t.string :group_name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
