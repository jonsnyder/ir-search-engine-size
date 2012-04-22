class SampledUrl < ActiveRecord::Base
  belongs_to :engine
  belongs_to :strategy
  attr_accessible :query, :result_number, :url
end
