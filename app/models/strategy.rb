class Strategy < ActiveRecord::Base
  attr_accessible :name, :options

  has_many :sampled_urls
  has_many :collect_queries
  has_many :collected_matches

  serialize :options, Hash
end
