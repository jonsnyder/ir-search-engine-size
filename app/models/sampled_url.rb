class SampledUrl < ActiveRecord::Base
  belongs_to :engine
  belongs_to :strategy
  has_many :collect_queries

  attr_accessible :query, :result_number, :url, :strategy, :engine
end
