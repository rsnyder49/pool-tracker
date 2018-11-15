class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    creat_table :users do |t| 
      t.string :username 
    end
  end
end
