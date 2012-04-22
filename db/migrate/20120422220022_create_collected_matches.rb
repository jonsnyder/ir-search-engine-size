class CreateCollectedMatches < ActiveRecord::Migration
  def change
    create_table :collected_matches do |t|
      t.references :collected_url
      t.boolean :is_match
      t.references :strategy

      t.timestamps
    end
    add_index :collected_matches, :collected_url_id
    add_index :collected_matches, :strategy_id
  end
end
