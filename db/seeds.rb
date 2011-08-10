# encoding : utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


PrProjectType.delete_all
PrProjectType.create!(:ptype => 'Excel', :image_path => "<img src='images/excel.png' />")
PrProjectType.create!(:ptype => 'Access', :image_path => "<img src='images/access.png' />")
PrProjectType.create!(:ptype => 'Outil', :image_path => "<img src='images/outil.png' />")
PrProjectType.create!(:ptype => 'Evolution', :image_path => "<img src='images/evolution.png' />")

["1","2-10","11-100","+100"].each do |nb|
  PrNbUser.find_or_create_by_number(nb)
end

["Plusieurs fois par jour","Journalière","Hebdomadaire","Mensuelle"].each do |freq|
  PrUsageFreq.find_or_create_by_freq(freq)
end

["Instantanné","1-10 minutes","10-60 minutes","Quelques heures"].each do |time|
  PrProcessTime.find_or_create_by_time(time)
end


["Xapian","Talend","Asterisk","ADV","SpagoBI","FreeNX","BookmarkSync","JFire","Mifos","OpenERP","SQL Ledger","NewGenLib","Molekel","OpenAFS","Weka","RapidMiner"].each do |app|
  Application.find_or_create_by_name(app)
end
