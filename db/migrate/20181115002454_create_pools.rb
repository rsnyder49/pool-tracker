class CreatePools < ActiveRecord::Migration[5.2]
  def change
    creat_table :pools do |t|
      t.string :address
      t.integer :user_id
    end
  end
end
