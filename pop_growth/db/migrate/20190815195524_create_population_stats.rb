class CreatePopulationStats < ActiveRecord::Migration[5.2]
  def change
    create_table :population_stats do |t|
      t.string :name
      t.string :lsad
      t.integer :pop_2015
      t.integer :pop_2014
      t.integer :cbsa_id

      t.timestamps
    end
  end
end
