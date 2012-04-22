class CollectQuery < ActiveRecord::Base
  belongs_to :sampled_url
  belongs_to :strategy
  has_many :collected_urls
  
  attr_accessible :query
end
