class CreatePopulationEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :population_estimates do |t|
      t.integer :year
      t.integer :estimate

      t.timestamps
    end
  end
end
