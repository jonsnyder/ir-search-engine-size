class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :term
      t.integer :freq
    end

    add_index :terms, :freq
    add_index :terms, :term
  end
end
