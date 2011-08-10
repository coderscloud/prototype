class PrNbUser < ActiveRecord::Base
  attr_accessible :number
  has_one :project
end
