class Application < ActiveRecord::Base
  #joining table
  has_many :interfacings
  has_many :projects, :through => :interfacings
end
