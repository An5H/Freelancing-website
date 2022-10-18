class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :job_heading
      t.string :job_type
      t.text :job_description
      t.text :additional_info
      t.timestamps
    end
  end
end
