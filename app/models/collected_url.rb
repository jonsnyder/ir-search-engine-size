class CollectedUrl < ActiveRecord::Base
  belongs_to :collect_query
  belongs_to :engine
  has_many :collected_matches

  attr_accessible :url
end
