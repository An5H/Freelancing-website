class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :profession
      t.float :rating
      t.boolean :open_to_work
      t.boolean :open_to_hire
      t.integer :experience
      t.string :contact_number
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
