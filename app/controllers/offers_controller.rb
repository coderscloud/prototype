# encoding: utf-8
class OffersController < ApplicationController
  #called when making an offer
  def new
    @project = Project.find(params[:project_id])
    @offer = @project.offers.build
  end
  
    # they will be taken here and eventually back to the show page
  def create
      @project = Project.find(params[:project_id])
      @offer = @project.offers.build(params[:offer])
      if @offer.save
        flash[:success] = "Votre offre a été soumise avec succès."
        redirect_to  @project
      else
        render :action => "new"
      end
  end
  

end
