class CreateCollectedUrls < ActiveRecord::Migration
  def change
    create_table :collected_urls do |t|
      t.references :collect_query
      t.references :engine
      t.text :url

      t.timestamps
    end
    add_index :collected_urls, :collect_query_id
    add_index :collected_urls, :engine_id
  end
end
