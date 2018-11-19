class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t| 
      t.string :address1
      t.string :address2
      t.string :city 
      t.string :state 
      t.integer :zip
      t.integer :user_id
    end
  end
end
