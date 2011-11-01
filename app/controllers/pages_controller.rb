# encoding: utf-8
class PagesController < ApplicationController
  def home
    @title = "CodersCloud"
    @myprojects = Project.first(3)
  end

  def projsearch
    @search = Project.search(params[:search])
    @projects = @search.all
  end
  
  def dashboard
    @project = Project.find(params[:projectid])
    @expiredtasks = @project.tasks.where("end_date < ? AND status!= ?", Time.now, "Terminée")
    @currenttasks = @project.tasks.where("end_date > ? AND status = ?", Time.now,"En cours")
    @comingtasks = @project.tasks.where("status= ?", "Active")
    
    @expiredmilestones = @project.milestones.where("date < ? AND status= ?", Time.now, "Actif")
    @comingmilestones = @project.milestones.where("date > ? AND status= ?", Time.now,"Actif")
    
    

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
    
    
  end
  

end
