jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })

function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
        });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});

jQuery.fn.submitWithAjax = function() {
  this.unbind('submit', false);
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })

  return this;
};

//Send data via get if JS enabled
jQuery.fn.getWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.get($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

//Send data via Post if JS enabled
jQuery.fn.postWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.post($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};


jQuery.fn.putWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.put($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};



jQuery.fn.deleteWithAjax = function() {
  this.removeAttr('onclick');
  this.unbind('click', false);
  this.click(function() {
    $.delete_($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};


//This will "ajaxify" the links
function ajaxLinks(){
    $('.ajaxForm').submitWithAjax();
    $('a.get').getWithAjax();
    $('a.post').postWithAjax();
    $('a.put').putWithAjax();
    $('a.delete').deleteWithAjax();
}

$(document).ready(function() {

// All non-GET requests will add the authenticity token
  // if not already present in the data packet
 $(document).ajaxSend(function(event, request, settings) {
       if (typeof(window.AUTH_TOKEN) == "undefined") return;
       // IE6 fix for http://dev.jquery.com/ticket/3155
       if (settings.type == 'GET' || settings.type == 'get') return;

       settings.data = settings.data || "";
       settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
     });

  ajaxLinks();

	//used for project types animations
	$(".proj_type_select label img").hover(function(){
	   $(this).addClass("hover").stop()
				.animate({
					width: '110px', /* Set new width */
					height: '110px', /* Set new height */

				}, 200);
	 },function(){
	   $(this).removeClass("hover").stop()
				.animate({
							width: '96px', /* Set width back to default */
							height: '96px', /* Set height back to default */
						}, 400);
	
	 });
	
		//used for project types animations
	$(".proj_type_select label img").click(function(){
	   $(".proj_type_select label img").removeClass("selected");
			$(this).addClass("selected");
	 
	 });
	
	//used for applications input token
	$('#project_application_tokens').tokenInput('/applications.json', { crossDomain: false  });  
	
	//used for programming langages input token
	$('#project_prog_lang_tokens').tokenInput('/prog_langs.json', { crossDomain: false, theme: 'facebook' }  );
	
	// Initialize Smart Wizard
	        $('#wizard').smartWizard(
					 {
					  // Properties
					    selected: 0,  // Selected Step, 0 = first step   
					    keyNavigation: true, // Enable/Disable key navigation(left and right keys are used if enabled)
					    enableAllSteps: false,  // Enable/Disable all steps on first load
					    transitionEffect: 'slideleft', // Effect on navigation, none/fade/slide/slideleft
					    contentURL:null, // specifying content url enables ajax content loading
					    contentCache:true, // cache step contents, if false content is fetched always from ajax url
					    cycleSteps: false, // cycle step navigation
					    enableFinishButton: false, // makes finish button enabled always
					    errorSteps:[],    // array of step numbers to highlighting as error steps
					    labelNext:'Suivant', // label for Next button
					    labelPrevious:'Precédant', // label for Previous button
					    labelFinish:'Terminer',  // label for Finish button        
					  // Events
					    onLeaveStep: leaveAStepCallback, // triggers when leaving a step
					    onShowStep: null,  // triggers when showing a step
					    onFinish: null  // triggers when Finish button is clicked
					 }
					);
		     function leaveAStepCallback(obj){
		        var step_num= obj.attr('rel'); // get the current step number
		        return validateSteps(step_num); // return false to stay on step and true to continue navigation 
		      }

		      function onFinishCallback(){
		       if(validateAllSteps()){
		        $('form').submit();
		       }
		      }
					//validations for wizard's forms
					if ($('#wizard').length){ //if we are in wizard page
	          var project_title = new LiveValidation('project_title');
						project_title.add( Validate.Presence );
						var project_objective = new LiveValidation('project_objective');
						project_objective.add( Validate.Presence );
						var project_start_date = new LiveValidation('project_start_date');
						project_start_date.add( Validate.Format, { pattern: /[0-3][0-9]\/(0|1)[0-9]\/(19|20)[0-9]{2}/i, failureMessage: "Date invalide" } );
						project_start_date.add( Validate.Length, { is: 10, failureMessage: "Date invalide" }  );					
						var project_deliv_date = new LiveValidation('project_deliv_date');
						project_deliv_date.add( Validate.Format, { pattern: /[0-3][0-9]\/(0|1)[0-9]\/(19|20)[0-9]{2}/i, failureMessage: "Date invalide" } );
						project_deliv_date.add( Validate.Length, { is: 10, failureMessage: "Date invalide" }  );
					}
		      // Your Step validation logic
		      function validateSteps(stepnumber){
		        var isStepValid = true;
		        if(stepnumber == 1){	
							if (($('input[type=radio]:checked').size() == 0))
							{
								isStepValid=false;
								 $('#wizard').smartWizard('setError',{stepnum:1,iserror:!isStepValid});
									$('#wizard').smartWizard('showMessage',"Vous devez choisir un type de projet");
							}
							else{
								$('#wizard').smartWizard('setError',{stepnum:1,iserror:!true});							
							}						
						}
						
		        if(stepnumber == 4){		
							isStepValid = LiveValidation.massValidate( [ project_title, project_objective ] );
							setError(stepnumber,isStepValid);
						}
						if(stepnumber == 6){		
							isStepValid = LiveValidation.massValidate( [ project_start_date ] );
							
							setError(stepnumber,isStepValid);
						}
	
     				return isStepValid;
		      }
		
			   function setError(step,state){
			       	$('#wizard').smartWizard('setError',{stepnum:step,iserror:!state}); 
							if (!state) {$('#wizard').smartWizard('showMessage',"Veuillez corriger les erreurs de l'étape "+step+".");}
			   }
			
			
					


			
	//DAtepicker 
		$('.datepicker').datepicker({ dateFormat: 'dd/mm/yy'}); //for_project_search 

  //check all fonctionality for projects types
	$(function () { // this line makes sure this code runs on page load
		$('.checkall').click(function () {
			$(this).parents('ul:eq(0)').find(':checkbox').attr('checked', this.checked);
		});
	});

$( "#tabs" ).tabs();
		
		
		
});

		

