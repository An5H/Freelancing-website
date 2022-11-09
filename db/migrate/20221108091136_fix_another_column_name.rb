class FixAnotherColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_email, :email
  end
end
