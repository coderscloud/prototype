class Milestone < ActiveRecord::Base
  attr_accessible :date,:status, :task_id, :project_id, :name
  belongs_to :project
  
  has_one :task
  
  validates(:name, :presence => true)
  validates(:date, :presence => true)

end
