class PrProjectType < ActiveRecord::Base
    attr_accessible :ptype, :image_path
    has_one :project
end
