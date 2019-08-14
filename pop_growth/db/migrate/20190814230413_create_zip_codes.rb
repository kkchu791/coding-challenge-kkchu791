class CreateZipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_codes do |t|
      t.integer :zip_code
      t.integer :cbsa

      t.timestamps
    end
  end
end
