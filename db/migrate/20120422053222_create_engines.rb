class CreateEngines < ActiveRecord::Migration
  def change
    ActiveRecord::Base.transaction do
      create_table :engines do |t|
        t.string :name
        t.string :type
        
        t.timestamps
      end
      
      Engine::Google.create
      Engine::Bing.create
      Engine::Blekko.create
      Engine::Ask.create
    end
  end
end
