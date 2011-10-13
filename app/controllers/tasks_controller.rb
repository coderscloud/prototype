# encoding: utf-8
class TasksController < ApplicationController
  #called when making an offer
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end
  
    # they will be taken here and eventually back to the show page
  def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.build(params[:task])
      if @task.save
        flash[:success] = "La tâche a été rajoutée  avec succès."
        redirect_to  @project
      else
        render :action => "new"
      end
  end

  def index
    @project = Project.find(params[:project_id])

  end
  
end
