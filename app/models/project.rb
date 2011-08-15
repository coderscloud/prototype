class Project < ActiveRecord::Base
  attr_accessible :title, :employer_id, :pr_project_type_id, :pr_nb_user_id,  :pr_process_time_id, :pr_usage_freq_id, :application_tokens,
                  :prog_lang_tokens, :func_skills, :pr_arch_id, :objective,:deliv_date, :start_date, :estimated_load
  
  belongs_to :pr_process_time
  belongs_to :pr_project_type
  belongs_to :pr_usage_freq
  belongs_to :pr_nb_user
  belongs_to :pr_arch
  
  has_many :interfacings
  has_many :applications, :through => :interfacings
  
  has_many :developments
  has_many :prog_langs, :through => :developments
  
  attr_reader :application_tokens # used for applications associations
  attr_reader :prog_lang_tokens # used for programming languages associations
  
  validates(:pr_project_type_id, :presence => true)
  validates(:title, :presence => true)
  
  def application_tokens=(ids)
    self.application_ids = ids.split(",")
  end
  
  def prog_lang_tokens=(ids)
    self.prog_lang_ids = ids.split(",")
  end
end
