class Strategy < ActiveRecord::Base
  attr_accessible :name, :options

  serialize :options, Hash
end
