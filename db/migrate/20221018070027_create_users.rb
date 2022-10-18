class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :username
      t.string :email
      t.string :password
      t.datetime :date_of_birth
      t.boolean :unread_notifications
      t.string :role
      t.timestamps
    end
  end
end
