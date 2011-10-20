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
  

end
