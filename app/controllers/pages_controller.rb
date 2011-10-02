class PagesController < ApplicationController
  def home
    @title = "CodersCloud"
    @myprojects = Project.all()
  end

  def projsearch
    @search = Project.search(params[:search])
    @projects = @search.all
  end
  
  def dashboard
    @project = Project.find(params[:projectid])
    @allprojects = Project.all()
    
  end
  

end
