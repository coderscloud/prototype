# encoding : utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


# PrProjectType.delete_all
# PrProjectType.create!(:ptype => 'Excel', :image_path => "<img src='images/excel.png' />")
# PrProjectType.create!(:ptype => 'Access', :image_path => "<img src='images/access.png' />")
# PrProjectType.create!(:ptype => 'Outil', :image_path => "<img src='images/outil.png' />")
# PrProjectType.create!(:ptype => 'Evolution', :image_path => "<img src='images/evolution.png' />")


user = User.find_or_create_by_email("test@test.com")
user.login = "test"
user.password="testtest"
user.password_confirmation="testtest"
user.save()

PrProjectType.find_or_create_by_ptype(:ptype => 'Excel', :image_path => "<img src='/images/excel.png' />")
PrProjectType.find_or_create_by_ptype(:ptype => 'Access', :image_path => "<img src='/images/access.png' />")
PrProjectType.find_or_create_by_ptype(:ptype => 'Outil', :image_path => "<img src='/images/outil.png' />")
PrProjectType.find_or_create_by_ptype(:ptype => 'Evolution', :image_path => "<img src='/images/evolution.png' />")


["1","2-10","11-100","+100"].each do |nb|
  PrNbUser.find_or_create_by_number(nb)
end

["Plusieurs fois par jour","Journalière","Hebdomadaire","Mensuelle"].each do |freq|
  PrUsageFreq.find_or_create_by_freq(freq)
end

["Instantanné","1-10 minutes","10-60 minutes","Quelques heures"].each do |time|
  PrProcessTime.find_or_create_by_time(time)
end

["Client lourd","Web"].each do |arch|
  PrArch.find_or_create_by_arch(arch)
end


["Xapian","Talend","Asterisk","ADV","SpagoBI","FreeNX","BookmarkSync","JFire","Mifos","OpenERP","SQL Ledger","NewGenLib","Molekel","OpenAFS","Weka","RapidMiner"].each do |app|
  Application.find_or_create_by_name(app)
end

["C#","C","C++","Langage D","Pascal","Basic","Asp","java","Javascript","Python","Boo","ASP","Assembler","Eiffel","Perl","Rebol","Ruby","Tcl","NetRexx","Lua","Cobol","Fortran","Lisp","Scheme","Prolog","SQL","Forth","Scala","XML"].each do |lang|
  ProgLang.find_or_create_by_name(lang)
end

User.find_or_create_by_id(:id => '10', :login => "emplodyer",:email => "empldoyer@linkao.fr", :encrypted_password => "b66a74ff12f29939acdf4f320eab75e2c7e969249274bd0364639dacf20b83c5", :salt => "09bbc1f00a66bcffe11957b781b247e1186cf08b356c4f1c22cc2a170e634824", :user_type => "1")
User.find_or_create_by_id(:id => '11', :login => "freelancer",:email => "freelancer@linkao.fr", :encrypted_password => "0ea9195b1ed80f0665d948fd2a2345611cfc56a859c0b7bd5d9ac7c4ff52d866", :salt => "8f6ae6cfdb661bb1c3808dc54e57bce3a86ef6c4b4b07c00caba7434e21ad7f3", :user_type => "2")

