#Creates xml with values for sales data of products 
#along with their names.
#The values required for building the xml is obtained as parameter arr_data
#It expects an array in which each element is 
#itself an array with first element as label and second element as value
xml = Builder::XmlMarkup.new
xml.chart(:dateFormat=>"dd/mm/yyyy" ,:hoverCapBorderColor=>"2222ff" ,:hoverCapBgColor=>"e1f5ff", :ganttWidthPercent=>"60", 
          :ganttLineAlpha=>"80", :canvasBorderColor=>"024455", :canvasBorderThickness=>"0", :gridBorderColor=>"4567aa",
           :gridBorderAlpha=>"20") do
            
            xml.categories( :bgColor=>"009999") do           	  
               	xml.category(:start=>@begin_date, :end=>@finish_date, :align=>"center", :name=>"Nom du projet",  :fontColor=>"ffffff", :isBold=>"1", :fontSize=>"16")   
             end
            xml.categories( :bgColor=>"4567aa" ,:fontColor=>"ff0000") do           	  
               xml.category(:start=>@begin_date, :end=>@finish_date, :align=>"center", :name=>"Mois",  :fontColor=>"ffffff", :isBold=>"1", :fontSize=>"16")   
            end
            
            xml.categories( :bgColor=>"ffffff" ,:fontColor=>"1288dd", :fontSize=>"10") do      
              for month in @monthes_list  
               xml.category(:start=>month[:start], :end=>month[:end], :align=>"center", :name=>month[:month],   :isBold=>"1")
              end
   
            end
            
             xml.processes( :headerText=>"Tâches" ,:fontColor=>"000000" ,:fontSize=>"11" ,:isBold=>"1" ,:isAnimated=>"1" ,:bgColor=>"4567aa" ,:headerVAlign=>"right" ,:headerbgColor=>"4567aa" ,:headerFontColor=>"ffffff" ,:headerFontSize=>"16"  ,:align=>"left", :bgAlpha=>"25") do           	  
                for task in @sorted_tasks
                 xml.process(:name=>task[:name],   :id=>task[:id])
               end
            end
            
             xml.tasks( :width=>"10") do    
                for task in @sorted_tasks       	  
                  xml.task(:name=>"Planned" ,:processId=>task[:id] ,:start=>task[:start_date] ,:end=>task[:end_date] ,:id=>task[:id] ,:color=>"4567aa" ,:height=>"10" ,:topPadding=>"5" ,:animation=>"1", :alpha=>"100", :percentComplete=>"78")     
                end
            end
            
             xml.milestones do           	  
                 xml.milestone(:date=>"18/4/2005" ,:taskId=>"1-1" ,:color=>"2E4472" ,:shape=>"star" ,:toolText=>"Original moving date")
            end
                     
end