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


