class Task < ActiveRecord::Base
  attr_accessible :start_date, :end_date,:nb_days, :name , :status, :progress
  belongs_to :project
  
  validates(:name, :presence => true)
  validates(:start_date, :presence => true)
  validates(:end_date, :presence => true)

end
