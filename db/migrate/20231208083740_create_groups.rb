class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :owner_id, null: false
      t.string :group_name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
