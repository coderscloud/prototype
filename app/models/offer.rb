class Offer < ActiveRecord::Base
   attr_accessible :start_date, :end_date,:nb_days, :message , :submitter_id
   belongs_to :project
   
   validates(:message, :presence => true)
   validates(:project_id, :presence => true)
      validates(:submitter_id, :presence => true)
   
   
end
