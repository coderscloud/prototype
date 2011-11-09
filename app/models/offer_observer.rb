class OfferObserver < ActiveRecord::Observer

  # OFFER OBSERVER : new offer posted
  def after_create(offer)
    if offer.project
      Notification.add(offer.project.employer, Notification::OFFER_POSTED, offer)
    end
  end

end