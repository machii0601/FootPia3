class CreateGenrus < ActiveRecord::Migration[6.1]
  def change
    create_table :genrus do |t|

      t.timestamps
    end
  end
end
