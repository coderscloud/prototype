class Interfacing < ActiveRecord::Base
  belongs_to :project
  belongs_to :application
end
