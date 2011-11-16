# encoding: utf-8
class TasksController < ApplicationController
  #called when making an offer
  protect_from_forgery :except => [:post_data]
  
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


       index_columns ||= [ :id, :name, :start_date, :end_date, :nb_days, :progress, :status]
       current_page = params[:page] ? params[:page].to_i : 1
       rows_per_page = params[:rows] ? params[:rows].to_i : 10

       conditions={:page => current_page, :per_page => rows_per_page}
       conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)

       if params[:_search] == "true"
         conditions[:conditions] = filter_by_conditions(index_columns)
       end

       @tasks = @project.tasks.paginate(conditions)

       respond_to do |format|
         format.html # index.html.erb
         format.json { render :json => @tasks.to_jqgrid_json(index_columns, current_page, rows_per_page, @tasks.count) }

     end


  end

  def post_data
    if params[:oper] == "del"
      Task.find(params[:id]).destroy
    else
      if params[:progress]
        progress= params[:progress] 
      else 
        progress=0
      end
      
      if params[:status]
        status= params[:status] 
      else 
        status="Active"
      end
      
      
      task_params = { :project_id => params[:project_id], :name => params[:name], :start_date => params[:start_date], :end_date => params[:end_date], 
                      :progress => progress, :status => status, :nb_days => params[:nb_days] }
      if params[:id] == "_empty"
        Task.create(task_params)
      else
        Task.find(params[:id]).update_attributes(task_params)
      end
    end
    render :nothing => true
  end
  
  
end
