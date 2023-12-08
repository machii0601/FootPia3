class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :genre, null: false
      t.string :owner_last_name, null: false
      t.string :owner_first_name, null: false
      t.string :owner_last_name_kana, null: false
      t.string :owner_first_name_kana, null: false
      t.string :group_name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
