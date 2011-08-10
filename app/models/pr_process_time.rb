class PrProcessTime < ActiveRecord::Base
  attr_accessible :time
  has_one :project
end
