# encoding: utf-8
class ApplicationsController < ApplicationController
  def index
        @applications = Application.where("name like ?", "%#{params[:q]}%") 
        respond_to do |format|  
          format.html  
          format.json { render :json => @applications.map(&:attributes) }
        end 
  end

end
