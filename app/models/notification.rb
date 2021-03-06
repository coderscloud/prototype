class Notification < ActiveRecord::Base
    belongs_to :user
    belongs_to :target, :polymorphic => true
    
    scope :unread, where(:is_read => false)
  
    default_scope :order => 'notifications.created_at DESC', :limit => 10
  
    OFFER_POSTED           = 1 #target --> model Offer
    PROJECT_ASSIGNED       = 2
    PROJECT_VALIDATED     =3
  
    class << self
      def add(user, notification_type, target)
        return false if user.blank? or notification_type.blank? or target.blank?
        notification = Notification.new(:user => user, :notification_type => notification_type, :target => target)
        notification.save!
      end
    end

end
