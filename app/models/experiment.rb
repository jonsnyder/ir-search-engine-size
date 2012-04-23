class Experiment < ActiveRecord::Base
  belongs_to :sample_strategy
  belongs_to :collect_strategy
  belongs_to :match_strategy
  attr_accessible :name
end
