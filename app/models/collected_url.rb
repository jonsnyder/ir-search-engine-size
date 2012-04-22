class CollectedUrl < ActiveRecord::Base
  belongs_to :collect_query
  belongs_to :engine
  attr_accessible :url
end
