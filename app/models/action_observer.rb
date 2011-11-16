class ActionObserver < ActiveRecord::Observer

  # OFFER OBSERVER : new offer posted
  def after_create(action)

      Notification.add(action.user, action.action_type, action)

  end

end