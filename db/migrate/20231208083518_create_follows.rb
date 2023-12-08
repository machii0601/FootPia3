class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :following, foreign_key: {to_table: :users}, null: false
      t.references :followed, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
