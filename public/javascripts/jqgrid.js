var lastsel;
jQuery(document).ready(function(){
          var mygrid = jQuery("#tasks").jqGrid({
              url:'/projects/1/tasks?q=1',
              editurl:'/projects/1/tasks/post_data',
              datatype: "json",
              colNames:['ID','Nom','Date de début','Date de fin','Nombre de jours','avancement','status'],
              colModel:[{name:'id', index:'id',width:35,resizable:false},
						{name:'name', index:'name',editable:true, editrules:{ required:true},width:300},
						{name:'start_date', index:'start_date',editable:true, editrules:{ required:true,date:true}, formatter:'date', formatoptions:{srcformat:"d/m/Y", newformat:"d/m/Y"}, editoptions:{dataInit: function(elm){setTimeout(function(){ jQuery(elm).dateinput({format: 'dd/mm/yyyy'}); },200);}}, width:130},
						{name:'end_date', index:'end_date',editable:true, editrules:{ required:true,date:true},formatter:'date', formatoptions:{srcformat:"d/m/Y", newformat:"d/m/Y"},editoptions:{dataInit: function(elm){setTimeout(function(){ jQuery(elm).dateinput({format: 'dd/mm/yyyy'}); },200);}},  width:130},
						{name:'nb_days', index:'nb_days',editable:true,editrules:{ integer:true}, width:110},
						{name:'progress', index:'progress',editable:true, editrules:{ integer:true, maxValue:100},formatter:'currency', formatoptions:{suffix:"%",decimalPlaces:"0"}, width:90},
						{name:'status', index:'status',editable:true,  edittype:"select", editoptions:{value:"Active:Active;En cours:En cours;Terminée:Terminée"}}],
              pager: '#tasks_pager',
              pagerpos:'center', 
              rowNum:10,
              rowList:[10,25,50,100],
              imgpath: '/images/jqgrid',
              viewrecords:true,
              height: '240',
              gridview: false,
              scrollrows: true,
              autowidth: false,
              loadui: 'enable',
              rownumbers: false,
              hiddengrid: false,
              hidegrid: false, 
              shrinkToFit: true, 
              footerrow: false,
              loadonce: false,
              cellsubmit: 'remote',
              cellEdit: 'false',
              userDataOnFooter: false,
              multiselect: false,

        onSelectRow: function(id){
          if(id && id!==lastsel){
            jQuery('#tasks').restoreRow(lastsel);
            jQuery('#tasks').editRow(id, true, null, null);
            lastsel=id;
          }
        },

              subGrid:false,

              caption: "liste des tâches"             
            })
            .navGrid('#tasks_pager',
              {edit:false,add:true,del:true,view:false,search:false,refresh:true},
              // Edit options
              {closeOnEscape:true,modal:true,recreateForm:true,width:300,closeAfterEdit:true,afterSubmit:function(r,data){return true;(r,data,'edit');},beforeShowForm:function(form){return true;(form);}},
              // Add options
              {closeOnEscape:true,modal:true,recreateForm:true,width:300,closeAfterAdd:true,afterSubmit:function(r,data){return true;(r,data,'add');},beforeShowForm:function(form){return true;(form);}},
              // Delete options
              {closeOnEscape:true,modal:true,afterSubmit:function(r,data){return true;(r,data,'delete');}}
            )
            .navButtonAdd("#tasks_pager",{caption:"",title:$.jgrid.nav.searchtitle, buttonicon :'ui-icon-search', onClickButton:function(){ mygrid[0].toggleToolbar() } })



            mygrid.filterToolbar();mygrid[0].toggleToolbar()
});