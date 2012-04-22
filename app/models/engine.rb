class Engine < ActiveRecord::Base
  attr_accessible :name, :type

  has_many :sampled_urls
  has_many :collected_urls
end
