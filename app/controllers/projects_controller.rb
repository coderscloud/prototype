class ProjectsController < ApplicationController
  
  def new
     @project = Project.new
  end

  def create      
      @project = Project.new(params[:project])
      if @project.save
        flash[:success] = "Welcome to Coders Cloud!"
        redirect_to @project
      else
        @title = "Sign up"
        render 'new'
      end
      
  end

end

