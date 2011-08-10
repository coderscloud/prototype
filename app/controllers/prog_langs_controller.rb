class ProgLangsController < ApplicationController
  def index
        @langs = ProgLang.where("name like ?", "%#{params[:q]}%") 
        respond_to do |format|  
          format.html  
          format.json { render :json => @langs.map(&:attributes) }
        end 
  end

end
