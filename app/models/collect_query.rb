class CollectQuery < ActiveRecord::Base
  belongs_to :sampled_url
  belongs_to :strategy
  attr_accessible :query
end
