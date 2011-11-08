class MilestonesController < ApplicationController
    protect_from_forgery :except => [:post_data]
   def index
       @project = Project.find(params[:project_id])

       @tasks = @project.tasks
         index_columns ||= [ :id, :name, :date, :task_id, :status]
         current_page = params[:page] ? params[:page].to_i : 1
         rows_per_page = params[:rows] ? params[:rows].to_i : 10

         conditions={:page => current_page, :per_page => rows_per_page}
         conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)

         if params[:_search] == "true"
           conditions[:conditions] = filter_by_conditions(index_columns)
         end

         @milestones = @project.milestones.paginate(conditions)

         respond_to do |format|
           format.html # index.html.erb
           format.json { render :json => @milestones.to_jqgrid_json(index_columns, current_page, rows_per_page, @milestones.count) }

         end
        

    end

    def post_data
      if params[:oper] == "del"
        Milestone.find(params[:id]).destroy
      else
        task=Task.where(:id => params[:task_id])
        milestone_params = { :project_id => params[:project_id], :name => params[:name], :date => task[0].end_date.to_s,:task_id => params[:task_id] , :status => params[:status],
           }
        if params[:id] == "_empty"
          Milestone.create(milestone_params)
        else
          Milestone.find(params[:id]).update_attributes(milestone_params)
        end
      end
      render :nothing => true
    end


  end
  

