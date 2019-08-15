class CreateCoreBasedStatAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :core_based_stat_areas do |t|
      t.string :cbsa
      t.string :mdiv

      t.timestamps
    end
  end
end
