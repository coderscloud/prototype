# encoding: utf-8
class NotificationsController < ApplicationController
  def setread
    Notification.update_all(:is_read => true)
    respond_to do |format|
          format.js { render 'somepartial' }
    end
    
  end
  def index
  end
end
