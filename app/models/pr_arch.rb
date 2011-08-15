class PrArch < ActiveRecord::Base
  attr_accessible :arch
  has_one :project
end
