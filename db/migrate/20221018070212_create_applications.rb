class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.integer :post_id
      t.integer :applicant_id
      t.string :status
      t.timestamps
    end
  end
end
