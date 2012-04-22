class CollectedMatch < ActiveRecord::Base
  belongs_to :collected_url
  belongs_to :strategy
  attr_accessible :is_match
end
