# encoding: utf-8

class ProjectsController < ApplicationController
  
  before_filter :authenticate, :only => [:new]
  
  def new
     @project = Project.new
  end

  def create  
      @user = current_user
      @project = current_user.projects.new(params[:project])
  
      if @project.save
        flash[:success] = "le projet a été rajouté avec succès"
        redirect_to @project
      else
        flash[:error] = "Une erreur s'est produite lors de la création du projet"
        redirect_to 'new'
      end     
  end
  
  def show
    @project = Project.find(params[:id])
    @offers= @project.offers
  end

  def authenticate
       deny_access unless signed_in?
  end
  
  def index
    
    @search = Project.search(params[:search])
    @projects = @search.all
  end
  
  def assign
    @project = Project.find(params[:id])
    offer_id=params[:project][:chosen_offer_id]
    @project.assign(offer_id)    
    @project.save
    @offer= Offer.find(offer_id)
    Action.add(@offer.submitter, Action::VALIDATE_PROJECT, @project, 1,1)   #assign validate_project action ton the offer maker
    flash[:success] = "Projet assigné avec succès"
    redirect_to @project;

  end
  
  def confirm
      @project = Project.find(params[:id])

       @tasks = @project.tasks
  end
  def update #called when the project is submitted
    @project = Project.find(params[:id])
    @project.status=Project::IN_PROGRESS
    @project.save
    Notification.add(@project.employer, Notification::PROJECT_VALIDATED, @project)
    @action=current_user.actions.where("action_type = ? AND target_id = ?", 2,@project.id ).first
    @action.status=2
    @action.save
    flash[:success] = "Le planning a été assigné avec succès"
    
     
    redirect_to "/"
  end

end

