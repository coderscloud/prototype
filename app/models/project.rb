# encoding: utf-8
class Project < ActiveRecord::Base
  attr_accessible :title, :employer_id, :pr_project_type_id, :pr_nb_user_id,  :pr_process_time_id, :pr_usage_freq_id, :application_tokens,
                  :prog_lang_tokens, :func_skills, :pr_arch_id, :objective,:deliv_date, :start_date, :estimated_load, :specfile, :status, :chosen_offer_id
  
  belongs_to :pr_process_time
  belongs_to :pr_project_type
  belongs_to :pr_usage_freq
  belongs_to :pr_nb_user
  belongs_to :pr_arch

  
  belongs_to :employer, :class_name=>'User'
  belongs_to :chosen_offer, :class_name=>'Offer'
  
  has_many :interfacings
  has_many :applications, :through => :interfacings
  
  has_many :developments
  has_many :prog_langs, :through => :developments
  
  has_many :offers
  has_many :tasks  
  has_many :milestones

  ACTIVE         = 1 #active status
  ASSIGNED       = 2 #active status  
  WAIT_GO        = 3
  IN_PROGRESS    = 4
  CLOSED         = 5
  
  STATUS = {1 => 'Actif', 4 => 'En cours', 5 => 'cloturé'}   #used to view the status

  mount_uploader :specfile, SpecfileUploader #for specs files upload
  
  attr_reader :application_tokens # used for applications associations
  attr_reader :prog_lang_tokens # used for programming languages associations
  
  validates(:pr_project_type_id, :presence => true)
  validates(:title, :presence => true)
  
  after_initialize :defaults
  public
  def assign(offer_id)
    self.chosen_offer_id=offer_id
    self.status=ASSIGNED
  
  end
  def defaults
    self.status||=ACTIVE
  end
  
  def application_tokens=(ids)
    self.application_ids = ids.split(",")
  end
  
  def prog_lang_tokens=(ids)
    self.prog_lang_ids = ids.split(",")
  end
  

end
