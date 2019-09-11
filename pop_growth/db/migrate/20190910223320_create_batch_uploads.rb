class CreateBatchUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :batch_uploads do |t|
      t.boolean :active
      t.integer :status
      t.datetime :upload_date

      t.timestamps
    end
  end
end
