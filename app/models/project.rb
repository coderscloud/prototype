class Project < ActiveRecord::Base
  attr_accessible :title, :employer_id, :pr_project_type_id, :pr_nb_user_id,  :pr_process_time_id, :pr_usage_freq_id, :application_tokens,
                  :prog_lang_tokens
  
  belongs_to :pr_process_time
  belongs_to :pr_project_type
  belongs_to :pr_usage_freq
  belongs_to :pr_nb_user
  
  has_many :interfacings
  has_many :applications, :through => :interfacings
  
  has_many :developments
  has_many :prog_langs, :through => :developments
  
  attr_reader :application_tokens # used for applications associations
  attr_reader :prog_lang_tokens # used for programming languages associations
  
  def application_tokens=(ids)
    self.application_ids = ids.split(",")
  end
  
  def prog_lang_tokens=(ids)
    self.prog_lang_ids = ids.split(",")
  end
end
