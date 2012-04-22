# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120422220022) do

  create_table "collect_queries", :force => true do |t|
    t.integer  "sampled_url_id"
    t.string   "query"
    t.integer  "strategy_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "collect_queries", ["sampled_url_id"], :name => "index_collect_queries_on_sampled_url_id"
  add_index "collect_queries", ["strategy_id"], :name => "index_collect_queries_on_strategy_id"

  create_table "collected_matches", :force => true do |t|
    t.integer  "collected_url_id"
    t.boolean  "is_match"
    t.integer  "strategy_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "collected_matches", ["collected_url_id"], :name => "index_collected_matches_on_collected_url_id"
  add_index "collected_matches", ["strategy_id"], :name => "index_collected_matches_on_strategy_id"

  create_table "collected_urls", :force => true do |t|
    t.integer  "collect_query_id"
    t.integer  "engine_id"
    t.text     "url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "collected_urls", ["collect_query_id"], :name => "index_collected_urls_on_collect_query_id"
  add_index "collected_urls", ["engine_id"], :name => "index_collected_urls_on_engine_id"

  create_table "engines", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sampled_urls", :force => true do |t|
    t.integer  "engine_id"
    t.text     "url"
    t.string   "query"
    t.integer  "result_number"
    t.integer  "strategy_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "sampled_urls", ["engine_id"], :name => "index_sampled_urls_on_engine_id"
  add_index "sampled_urls", ["strategy_id"], :name => "index_sampled_urls_on_strategy_id"

  create_table "strategies", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "options"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "terms", :force => true do |t|
    t.string  "term"
    t.integer "freq"
  end

  add_index "terms", ["freq"], :name => "index_terms_on_freq"

end
