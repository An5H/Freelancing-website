class CreateLikesofcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :likesofcomments do |t|
      t.references :comment, null: false, foreign_key: true
      t.integer :liker_id
      t.timestamps
    end
  end
end
