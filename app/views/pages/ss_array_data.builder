#Creates xml with values for sales data of products 
#along with their names.
#The values required for building the xml is obtained as parameter arr_data
#It expects an array in which each element is 
#itself an array with first element as label and second element as value
xml = Builder::XmlMarkup.new
xml.chart(:dateFormat=>"dd/mm/yyyy" ,:hoverCapBorderColor=>"2222ff" ,:hoverCapBgColor=>"e1f5ff", :ganttWidthPercent=>"60", 
          :ganttLineAlpha=>"80", :canvasBorderColor=>"024455", :canvasBorderThickness=>"0", :gridBorderColor=>"4567aa",
           :gridBorderAlpha=>"20") do
            
            # xml.categories( :bgColor=>"009999") do              
            #     xml.category(:start=>@begin_date, :end=>@finish_date, :align=>"center", :name=>"Nom du projet",  :fontColor=>"ffffff", :isBold=>"1", :fontSize=>"16")   
            #  end
            xml.categories( :bgColor=>"0078A5" ,:fontColor=>"ff0000") do           	  
               xml.category(:start=>@begin_date, :end=>@finish_date, :align=>"center", :name=>"Mois",  :fontColor=>"ffffff", :isBold=>"1", :fontSize=>"16")   
            end
            
            xml.categories( :bgColor=>"ffffff" ,:fontColor=>"1288dd", :fontSize=>"10") do      
              for month in @monthes_list  
               xml.category(:start=>month[:start], :end=>month[:end], :align=>"center", :name=>month[:month],   :isBold=>"1")
              end
   
            end
            
             xml.processes( :headerText=>"Tâches" ,:fontColor=>"000000" ,:fontSize=>"11" ,:isBold=>"1" ,:isAnimated=>"1" ,:bgColor=>"F47A20"  ,:headerbgColor=>"f47A20" ,:headerFontColor=>"ffffff" ,:headerFontSize=>"16"  ,:align=>"left", :bgAlpha=>"25") do           	  
                for task in @sorted_tasks
                 xml.process(:name=>task[:name],   :id=>task[:id])
               end
            end
            
             xml.tasks( ) do    
                for task in @sorted_tasks       	  
                  xml.task(:name=>"Planned" ,:processId=>task[:id] ,:start=>task[:start_date] ,:end=>task[:end_date] ,:id=>task[:id] ,:color=>"8BBA00", :borderColor=>"8BBA00" ,:animation=>"1", :alpha=>"75", :percentComplete=>"78")     
                end
            end
            
             xml.milestones do 
                for milestone in @milestones             	  
                 xml.milestone(:date=>milestone[:date] ,:taskId=>milestone.task_id ,:color=>"2E4472" ,:shape=>"star" ,:toolText=>milestone.name)
                end
            end
                     
end