class Application < ActiveRecord::Base
  has_many :interfacings
  has_many :projects, :through => :interfacings
end
