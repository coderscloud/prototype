# encoding: utf-8
module PagesHelper
  def tasks
    @project.tasks
  end
  
 def nb_milestones
   @project.milestones.count
 end
 
 def nb_endedmilestones
   @project.milestones.where("status=?", "Terminé").count
 end
 
 def nb_endedtasks
   @project.tasks.where("status=?", "Terminée").count
 end
 
 def nb_tasks
   tasks.count
 end
 
 def progress_milestones
   if nb_milestones>0
     (nb_endedmilestones*100/nb_milestones).to_i
   else
     0
   end
 end
 
 def progress_tasks
    if nb_tasks>0
      (nb_endedtasks*100/nb_tasks).to_i
    else
      0
    end
  end 
  
    
    def total_progress (project)
      @project=project
      total_days=0
      progress=0
      if @project.tasks.count>0
        tasks.each do |t|
          length= t.nb_days ? t.nb_days : ((t.end_date - t.start_date)/3600/24).to_i
          total_days=total_days+length
          if t.status=="Terminée"
            progress=progress+length
          else
            progress=progress+((t.progress*length)/100).to_i
          end
        end
      total_progress=(progress*100/total_days).to_i
      else
        0
      end
    
  end

    

    
end
