class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :name
      t.references :sample_strategy
      t.references :collect_strategy
      t.references :match_strategy

      t.timestamps
    end
    add_index :experiments, :sample_strategy_id
    add_index :experiments, :collect_strategy_id
    add_index :experiments, :match_strategy_id
  end
end
