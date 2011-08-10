class ProjectsController < ApplicationController
  
  def new
    @project = Project.new
  end

  def create
      @project = Project.new(params[:project])
      @project.save
      redirect_to @project
  end

end

