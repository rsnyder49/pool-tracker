class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    creat_table :users do |t| 
      t.string :username 
      t.string :email 
      t.string :password_digest
    end
  end
end
