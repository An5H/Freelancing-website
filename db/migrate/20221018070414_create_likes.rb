class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :liker_id
      t.timestamps
    end
  end
end
