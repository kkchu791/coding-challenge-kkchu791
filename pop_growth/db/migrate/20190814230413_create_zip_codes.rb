class CreateZipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_codes do |t|
      t.string :zip_code
      t.string :cbsa

      t.timestamps
    end
  end
end
