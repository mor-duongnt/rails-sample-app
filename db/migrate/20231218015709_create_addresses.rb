class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|

      t.string :name
      t.string :note
      t.integer :user_id
      t.timestamps
    end
  end
end
