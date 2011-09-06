class PagesController < ApplicationController
  def home
    @title = "CodersCloud"
  end

  def projsearch
    @search = Project.search(params[:search])
    @projects = @search.all
  end
  

end
