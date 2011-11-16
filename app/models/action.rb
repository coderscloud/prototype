class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, :polymorphic => true
  
 # scope :unread, where(:is_read => true) #to use as a method

  default_scope :order => 'actions.created_at DESC', :limit => 10

  VALIDATE_PROJECT           = 2 #target --> model Offer


  class << self
    def add(user, action_type, target, priority, status)
      return false if user.blank? or action_type.blank? or target.blank?
      action = Action.new(:user => user, :action_type => action_type, :target => target, :priority => priority, :status => status)
      action.save!
    end
  end
  
end
