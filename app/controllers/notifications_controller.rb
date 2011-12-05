# encoding: utf-8
class NotificationsController < ApplicationController

  def index
    Notification.update_all(:is_read => true) #update notifications as read
    @notifications = current_user.notifications
  end
  def notif_count
    @nb_notif= current_user.notifications.unread.count 
  end
end
