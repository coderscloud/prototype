class Milestone < ActiveRecord::Base
  attr_accessible :date,:status, :task_id, :project_id, :name
  belongs_to :project
  
  belongs_to :task
  
  validates(:name, :presence => true)
  validates(:date, :presence => true)

end
