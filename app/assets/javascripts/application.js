// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require modernizr/modernizr
//= require turbolinks
//= require bootstrap/dist/js/bootstrap.min
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require jquery.countdown
//= require jquery.countdown-es
//= require_tree .

$(document).ready(function () {

    $('.date').datepicker({
        format: 'yyyy/mm/dd'
    })
  
    toggleFields(); //call this first so we start out with the correct visibility depending on the selected form values
    //this will call our toggleFields function every time the selection value of our underAge field changes
    $("#offer_kind").change(function () {
        toggleFields();
    });

    $('#close').click(function() {
        location.reload();
    });

});

//this toggles the visibility of our parent permission fields depending on the current selected value of the underAge field

function toggleFields() {
    if ($("#offer_kind").val() === 'oferta2' )
        $("#offer_price").show();
    else
        $("#offer_price").hide();
}

// $(document).ready(function() {
// 	var date;
	
// 	function toggleFields() {
// 		if ($("#offer_kind").val() === 'oferta2')
// 			$("#offer_price").show();
// 		else
// 			$("#offer_price").hide();
// 	}
	
// 	$('.offer_id').click(function(event) {
// 		var dateVar, datesplit, datesubstring, newdate;
// 		dateVar = $(this).data('date');
// 		datesubstring = dateVar.substring(1, 11);
// 		datesplit = datesubstring.split("-");
// 		newdate = new Date(datesplit[0], datesplit[1] - 1, datesplit[2]);
// 		date = newdate;

// 	});
// 	$('.countdown').countdown({
// 			until: date,
// 			format: 'dHMS'
// 		});
// });


