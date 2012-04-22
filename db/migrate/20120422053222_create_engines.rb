class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
