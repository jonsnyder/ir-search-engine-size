class CreateStrategies < ActiveRecord::Migration
  def change
    create_table :strategies do |t|
      t.string :name
      t.string :type
      t.text :options

      t.timestamps
    end
  end
end
