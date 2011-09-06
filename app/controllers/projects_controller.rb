# encoding: utf-8

class ProjectsController < ApplicationController
  
  before_filter :authenticate, :only => [:create]
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
  end

  def authenticate
       deny_access unless signed_in?
  end
  
  def index
    
    @search = Project.search(params[:search])
    @projects = @search.all
  end

end

