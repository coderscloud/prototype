var lastsel;
jQuery(document).ready(function(){

  var mygrid = jQuery("#milestones").jqGrid({
      url:window.location.href.slice(window.location.href.indexOf('project') - 1) + '?q=1',
      editurl:window.location.href.slice(window.location.href.indexOf('project') - 1) +'/post_data',
      datatype: "json",
      colNames:['ID','Nom','Date','Status'],
      colModel:[{name:'id', index:'id',width:35,resizable:false},
				{name:'name', index:'name',editable:true, editrules:{ required:true},width:300},
				{name:'date', index:'date',editable:true, editrules:{ required:true,date:true}, formatter:'date', formatoptions:{srcformat:"d/m/Y", newformat:"d/m/Y"}, editoptions:{dataInit: function(elm){setTimeout(function(){ jQuery(elm).dateinput({format: 'dd/mm/yyyy'}); },200);}}, width:130},
				{name:'status', index:'status',editable:true,  edittype:"select", editoptions:{value:"Actif:Actif;Terminé:Terminé"}}],
      pager: '#milestones_pager',
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
    jQuery('#milestones').restoreRow(lastsel);
    jQuery('#milestones').editRow(id, true, null, null);
    lastsel=id;
  }
},

      subGrid:false,

      caption: "liste des Jalons"             
    })
    .navGrid('#milestones_pager',
      {edit:false,add:true,del:true,view:false,search:false,refresh:true},
      // Edit options
      {closeOnEscape:true,modal:true,recreateForm:true,width:300,closeAfterEdit:true,afterSubmit:function(r,data){return true;(r,data,'edit');},beforeShowForm:function(form){return true;(form);}},
      // Add options
      {closeOnEscape:true,modal:true,recreateForm:true,width:300,closeAfterAdd:true,afterSubmit:function(r,data){return true;(r,data,'add');},beforeShowForm:function(form){return true;(form);}},
      // Delete options
      {closeOnEscape:true,modal:true,afterSubmit:function(r,data){return true;(r,data,'delete');}}
    )
    .navButtonAdd("#milestones_pager",{caption:"",title:$.jgrid.nav.searchtitle, buttonicon :'ui-icon-search', onClickButton:function(){ mygrid[0].toggleToolbar() } })



    mygrid.filterToolbar();mygrid[0].toggleToolbar()
  
});