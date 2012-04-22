class CreateSampledUrls < ActiveRecord::Migration
  def change
    create_table :sampled_urls do |t|
      t.references :engine
      t.text :url
      t.string :query
      t.integer :result_number
      t.references :strategy

      t.timestamps
    end
    add_index :sampled_urls, :engine_id
    add_index :sampled_urls, :strategy_id
  end
end
