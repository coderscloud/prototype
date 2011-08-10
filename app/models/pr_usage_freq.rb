class PrUsageFreq < ActiveRecord::Base
  attr_accessible :freq
  has_one :project
end
