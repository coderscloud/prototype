class Development < ActiveRecord::Base
  #joining table
  belongs_to :project
  belongs_to :prog_lang
end
