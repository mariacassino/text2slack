class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :user_name
      t.string :user_email
      t.text :content

      t.timestamps null: false
    end
  end
end
