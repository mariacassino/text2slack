class AddPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string, :null => true 
  end
end
