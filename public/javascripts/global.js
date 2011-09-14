// HTML5 placeholder plugin version 0.3
// Enables cross-browser* html5 placeholder for inputs, by first testing
// for a native implementation before building one.
//
// USAGE: 
//$('input[placeholder]').placeholder();

(function($){
  
  $.fn.placeholder = function(options) {
    return this.each(function() {
      if ( !("placeholder"  in document.createElement(this.tagName.toLowerCase()))) {
        var $this = $(this);
        var placeholder = $this.attr('placeholder');
        $this.val(placeholder).data('color', $this.css('color')).css('color', '#aaa');
        $this
          .focus(function(){ if ($.trim($this.val())===placeholder){ $this.val('').css('color', $this.data('color')); } })
          .blur(function(){ if (!$.trim($this.val())){ $this.val(placeholder).data('color', $this.css('color')).css('color', '#aaa'); } });
      }
    });
  };
}(jQuery));

var menuYloc = null;
var sortableCookieExpiry = 365;
var sortableCookie = "sortable-order"
var sortableName = ".sortable";

// perform JavaScript after the document is scriptable.
$(document).ready(function() {
	
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


					//used for applications input token
					$('#project_application_tokens').tokenInput('/applications.json', { crossDomain: false  });  

					//used for programming langages input token
					$('#project_prog_lang_tokens').tokenInput('/prog_langs.json', { crossDomain: false, theme: 'facebook' }  );				



	

	  //check all fonctionality for projects types

			function CheckAll(name,id )
			{
			   $("#"+id).click(function()				
				{
					var checked_status = this.checked;
					this.checked=true;
					$("input[name='"+ name +"']").each(function()
					{
						this.checked = false;
					});
				});

					$("input[name='"+ name +"']").click(function()				
					{
						var checked_status = this.checked;
						if (checked_status){
							$("#"+id).each(function()
							{
								this.checked = false;
							});
						}
					});
			}

			CheckAll('search[pr_project_type_id_in][]',"chk_proj_type");
			CheckAll('search[status_in][]',"chk_proj_status");
			CheckAll('search[applications_id_in][]',"chk_proj_apps");
			CheckAll('search[prog_langs_id_in][]',"chk_proj_langs");

		

    /**
     * Main Menu Shortcuts Toggle
     */
    $('.chevron').click(function(){
        if ($(this).hasClass('toggle-up')) {
            if (!$.browser.msie) {
                $('.shortcuts').slideUp();
            } else {
                $('.shortcuts').hide();
            }
        } else {
            if (!$.browser.msie) {
                $('.shortcuts').slideDown();
            } else {
                $('.shortcuts').show();
            }
        }
        $(this).toggleClass('toggle-up');
    });

    /**
     * Skin select elements
     */
    // $('select:not([multiple])').each(function(){
    //        var select = this;
    //        $(this).wrap('<span class="ui-select" />')
    //            .before('<span class="ui-select-value" />')
    //            .bind('change click', function(){
    //                $(this).prev().html($(this).find('option:selected').text());
    //            })
    //            .after('<a class="ui-select-button button button-gray"><span></span></a>')
    //            .prev().html($(this).find('option:selected').text());
    //        $(this).mousedown(function(){
    //            $(this).next().addClass("active");
    //        }).mouseup(function(){
    //            $(this).next().removeClass("active");
    //        }).hover(function(){
    //            $(this).next().addClass("hover");
    //        }, function(){
    //            $(this).next().removeClass("hover");
    //        }).parent().disableSelection();
    //    });
    // 
    //    /**
    //     * Skin file input elements
    //     */
    //    $(':file').each(function(){
    //        var file = this;
    //        $(this).attr('size', 25).wrap('<span class="ui-file" />')
    //            .before('<span class="ui-file-value">No file chosen</span><button class="ui-file-button button button-gray">Browse...</button>')
    //            .change(function(){
    //                $(file).parent().find('.ui-file-value').html($(this).val()? $(this).val() : 'No file chosen');
    //            })
    //            .hover(
    //                function(){ $(file).prev().addClass('hover');},
    //                function(){ $(file).prev().removeClass('hover');}
    //            ).mousedown(function(){$(file).prev().addClass('active');})
    //            .bind('mouseup mouseleave', function(){$(file).prev().removeClass('active');})
    //            .parent().disableSelection();
    //    });
   
    /**
     * Setup tooltips
     */
    $('[title]').tooltip({
        effect: 'slide', offset: [-14, 0], position: 'top center', layout: '<div><em/></div>',
        onBeforeShow: function() {
            this.getTip().each(function(){
                if ($.browser.msie) {
                    PIE.attach(this);
                }
            });
        },
        onHide: function() {
            this.getTip().each(function(){
                if ($.browser.msie) {
                    PIE.detach(this);
                }
            });
        }
    }).dynamic({
            bottom: { direction: 'down', bounce: true }
    });

    /**
     * Setup the Accordions
     */
    $(".accordion").tabs(".accordion section", {tabs: 'header', effect: 'slide', initialIndex: null});

    /**
     * Setup the Tabs
     */
    $("ul.tabs").tabs("div.panes > section");

    /**
     * Setup the Sidebar tabs
     */
    $("ul.sidebar-tabs").tabs("div.panes > section");
    
    /**
     * Textbox Placeholder
     */
    $('input[placeholder]').placeholder();

    /**
     * attach calendar to date inputs
     */
    $(":date")
		.wrap('<span class="ui-date" />')
        .dateinput({trigger: true, format: 'mm/dd/yyyy', selectors: true})
        .focus(function(){$(this).parent().addClass('ui-focused'); return false;})
        .blur(function(){$(this).parent().removeClass('ui-focused'); return false;});

    /**
     * add close buttons to closeable message boxes
     */
    $(".message.closeable").prepend('<span class="message-close"></span>')
        .find('.message-close')
        .click(function(){
            $(this).parent().fadeOut(function(){$(this).remove();});
        });

    /**
     * setup popup balloons (add contact / add task)
     */
    $('.has-popupballoon').click(function(){
        // close all open popup balloons
        $('.popupballoon').fadeOut();
        $(this).next().fadeIn();
        return false;
    });

    $('.popupballoon .close').click(function(){
        $(this).parents('.popupballoon').fadeOut();
    });

    /**
     * floating menu
     */
    if ($('#wrapper > header').length>0) { menuYloc = parseInt($('#wrapper > header').css("top").substring(0,$('#wrapper > header').css("top").indexOf("px")), 10); }
    $(window).scroll(function () {
        var offset = 0;
        if ($('#wrapper > header').length>0) {
            offset = menuYloc+$(document).scrollTop();
            if (!$.browser.msie) { $('#wrapper > header').animate({opacity: ($(document).scrollTop()<=10? 1 : 0.8)}); }
        }
    });

    if (!$.browser.msie) {
        $('#wrapper > header').hover(
            function(){$(this).animate({opacity: 1});},
            function(){$(this).animate({opacity: ($(document).scrollTop()<=10? 1 : 0.8)});}
        );
    }

    /**
     * html element for the help popup
     */
    $('body').append('<div class="apple_overlay black" id="overlay"><iframe class="contentWrap" style="width: 100%; height: 500px"></iframe></div>');

    /**
     * this is the help popup
     */
    $("a.help[rel]").overlay({

        effect: 'apple',

        onBeforeLoad: function() {

            // grab wrapper element inside content
            var wrap = this.getOverlay().find(".contentWrap");

            // load the page specified in the trigger
            wrap.attr('src', this.getTrigger().attr("href"));
        }

    });

    /**
     * Form Validators
     */
    // Regular Expression to test whether the value is valid
    $.tools.validator.fn("[type=time]", "Please supply a valid time", function(input, value) { 
        return (/^\d\d:\d\d$/).test(value);
    });

    $.tools.validator.fn("[data-equals]", "Value not equal with the $1 field", function(input) {
        var name = input.attr("data-equals"),
        field = this.getInputs().filter("[name=" + name + "]"); 
        return input.val() === field.val() ? true : [name]; 
    });
     
    $.tools.validator.fn("[minlength]", function(input, value) {
        var min = input.attr("minlength");
        
        return value.length >= min ? true : {     
            en: "Please provide at least " +min+ " character" + (min > 1 ? "s" : "")
        };
    });
     
    $.tools.validator.localizeFn("[type=time]", {
        en: 'Please supply a valid time'
    });
     
    /**
     * setup the validators
     */
    // $(".form").validator({ 
    //     position: 'bottom left', 
    //     offset: [5, 0],
    //     messageClass:'form-error',
    //     message: '<div><em/></div>' // em element is the arrow
    // }).attr('novalidate', 'novalidate');

    if ($(sortableName).sortable) {
        $(sortableName).sortable({
            cursor: 'move',
            revert: 500,
            opacity: 0.7,
            appendTo: 'body',
            handle: 'header',
            items: '.widget-container[draggable=true]',
            placeholder: 'widget-placeholder grid_2',
            forcePlaceholderSize: true,
            start: function(event, ui) {
                ui.item.addClass('start-drag');
            },
            stop: function(event, ui) {
                ui.item.removeClass('start-drag');
            },
            update: function(event, ui) {
                if ($.cookie) {
                    $.cookie(sortableCookie, $(this).sortable("toArray"), { expires: sortableCookieExpiry, path: "/" });
                }
            }
        }).disableSelection();
    }

    /**
     * restore the order of sortable widgets
     */
    if ($.cookie) {
        restoreOrder(sortableName, sortableCookie);
    }

    /**
     * Widget Drag and Drop
     */
    $('.widget-container .widget')
    .hover(
        function(){
            if (!$(this).parent().hasClass('start-drag')) {
                $(this).find('header').animate({height : 30}).parents('.widget-container').siblings(':not(.start-drag)').find('header').animate({height: 4});
            }
            return false;
        },
        function() {
            if (!$(this).parent().hasClass('start-drag')) {
                $(this).find('header').animate({height : 4})
            }
            return false;
        }
    )
    .find('.widget-close').click(function(){
        $(this).parents('.widget-container').fadeOut(function(){$(this).remove();});
        // perhaps call an ajax function to remember the widget is closed
        // $.ajax({url: "somescript.php", data: {widgetId: $(this).parents('.widget-container').attr('id')});
        return false;
    })
   .parents('.widget-container').each(function(){
        $(this).css({height: $(this).find('.widget').height()+30}, "slow");
    });

    /**
     * Widget overlays
     */
    $(".widget.has-details > section").each(function(){
        var section = this;
        $(section).append('<a class="rollover" />')
            .find('.rollover')
            .attr('rel', $(section).prev().find('h2 > a').attr('rel'))
            .hover(
                function(){$(this).animate({opacity: 0.6});},
                function(){$(this).animate({opacity: 0});}
            ).parents('.widget').find('.rollover[rel]').overlay({
                effect: $.browser.msie? 'default' : 'drop',
                top: 'center',
                mask: {
                    color: '#000',
                    loadSpeed: 200,
                    opacity: 0.5
                }
            });
    });


    /**
     * Table Sorting, Row Selection and Pagination
     */
    if ($.paginate) {
        $("table.paginate").paginate({rows: 10, buttonClass: 'button-blue'});
    }
    if ($.tablesort) {
        $("table.tablesort").tablesort();
    }
    if ($.selectable) {
        $("table.selectable").selectable({
            onSelect: function(row) {
                // do something
            },
            onDeselect: function(row) {
                // do something
            }
        });
    }

    /**
     * Setup details viewing for table
     */
    $('table tr a.view-details').each(function(){
        var a = $(this);
        $(this).next().overlay({
            effect: $.browser.msie? 'default' : 'drop',
            top: 'center',
            mask: {
                color: '#000',
                loadSpeed: 200,
                opacity: 0.5
            },
            onClose: function() {
                this.getOverlay().appendTo(a.parent());
            }
        });
    }).click(function(){
        $(this).next().appendTo('body').overlay().load();
        return false;
    });

});

/**
 * Restores the sortable order from a cookie
 */
function restoreOrder(sortable, cookieName) {
    var list = $(sortable);
    if (!list) return;

    // fetch the saved cookie
    var cookie = $.cookie(cookieName);
    if (!cookie) return;

    // create array from cookie
    var IDs = cookie.split(",");

    // fetch current order
    var items = list.sortable("toArray");

    // create associative array from current order
    var current = [];
    for ( var v=0; v < items.length; v++ ){
        current[items[v]] = items[v];
    }

    for (var i = 0, n = IDs.length; i < n; i++) {
        // item id from saved order
        var itemID = IDs[i];

        if (itemID in current) {
            // select the item according to the saved order and reappend it to the list
            $(sortable).append($(sortable).children("#" + itemID));
        }
    }
}


/**
 * Custom jQuery Tools Overlay Effect, thanks to the great guys at flowplayer.org :)
 */
// create custom animation algorithm for jQuery called "drop" 
$.easing.drop = function (x, t, b, c, d) {
	return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
};

// loading animation
$.tools.overlay.addEffect("drop", function(css, done) { 
   
   // use Overlay API to gain access to crucial elements
   var conf = this.getConf(),
       overlay = this.getOverlay();           
   
   // determine initial position for the overlay
   if (conf.fixed)  {
      css.position = 'fixed';
   } else {
      css.top += $(window).scrollTop();
      css.left += $(window).scrollLeft();
      css.position = 'absolute';
   } 
   
   // position the overlay and show it
   overlay.css(css).show();
   
   // begin animating with our custom easing
   overlay.animate({ top: '+=55',  opacity: 1,  width: '+=20'}, 400, 'drop', done);
   
   /* closing animation */
   }, function(done) {
      this.getOverlay().animate({top:'-=55', opacity:0, width:'-=20'}, 300, 'drop', function() {
         $(this).hide();
         done.call();      
      });

   }



);