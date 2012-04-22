class CreateCollectQueries < ActiveRecord::Migration
  def change
    create_table :collect_queries do |t|
      t.references :sampled_url
      t.string :query
      t.references :strategy

      t.timestamps
    end
    add_index :collect_queries, :sampled_url_id
    add_index :collect_queries, :strategy_id
  end
end
