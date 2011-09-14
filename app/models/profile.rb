class Profile < ActiveRecord::Base

    attr_accessible :country

    belongs_to :user

end
