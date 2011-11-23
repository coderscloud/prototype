# encoding: utf-8
class PagesController < ApplicationController
  def home
    @title = "Linkao"
    
    if current_user
      @actions=Action.where("user_id= ? AND status=?", current_user.id, 1)
      if current_user.user_type == User::EMPLOYER
        @myprojects = Project.where("employer_id= ? AND projects.status=4",current_user.id)
      end
      if current_user.user_type == User::FREELANCER
        @myprojects = Project.joins(:chosen_offer => :submitter).where("submitter_id=? AND projects.status=4",current_user.id)
      end
      @nbexpired=0
      if @myprojects
        @expiredtasks = []
        @expiredmilestones = []
        @myprojects.each do |proj|
          @expiredtasks = @expiredtasks + proj.tasks.where("end_date < ? AND status!= ?", Time.now, "Terminée") 
          @expiredmilestones =  @expiredmilestones +  proj.milestones.where("date < ? AND status= ?", Time.now, "Actif")          
        end
      end
      nbexptasks= @expiredtasks ? @expiredtasks.count : 0
      nbexpmilestones= @expiredmilestones ? @expiredmilestones.count : 0
      nbactions = @actions ? @actions.count : 0
      @nbalerts=  nbexptasks + nbexpmilestones + nbactions
    end
    
  end

  def projsearch
    @search = Project.search(params[:search])
    @projects = @search.all
  end
  
  def dashboard
    @project = Project.find(params[:projectid])
    @expiredtasks = @project.tasks.where("end_date < ? AND status!= ?", Time.now, "Terminée")
    @currenttasks = @project.tasks.where("end_date > ? AND status = ?", Time.now,"En cours")
    @comingtasks = @project.tasks.where("status= ? AND end_date > ?", "Active",Time.now)
    @nbtasks=@project.tasks.count
    @expiredmilestones = @project.milestones.where("date < ? AND status= ?", Time.now, "Actif")
    @comingmilestones = @project.milestones.where("date > ? AND status= ?", Time.now,"Actif")
    @nbmilestones = @project.milestones.count

   
  end

  def gantt
    @project = Project.find(params[:projectid])
    response.content_type = Mime::HTML
    @tasks = @project.tasks
    @sorted_tasks=@tasks.sort_by { |task| task[:start_date] } #sorting the rows by start_date
    @last_date= @tasks.max {|a,b| a[:end_date] <=> b[:end_date] } #geting therow containing the last end_date
    
    @begin_date=@sorted_tasks[0].start_date.beginning_of_month
    @finish_date=@last_date.end_date.end_of_month
    @monthes_list=get_monthes(@begin_date,@finish_date)
    @milestones= @project.milestones

      
    
    
  end
  
  def all_read
    @project = Project.find(params[:projectid])
  end
    
  def files
    @project = Project.find(params[:projectid])
    
  end
    
    
    
  

end
