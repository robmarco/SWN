/*
 * File:        script.js
 * Version:     1.0
 * Author:      Roberto Marco
 * Info:        Function callings
 * 
 * This source file is free software
 * 
 * This source file is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.
 *	
 * This file is automatically included by javascript_include_tag :defaults
 */

function require(script) {
  $.ajax({
    url: script,
    dataType: "script",
    async: false,
    success: function () {
        // all good...
    },
    error: function () {
        throw new Error("Could not load script " + script);
    }
  });
}

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
  if ($(link).closest("tbody").attr("class")=="table_body") {
		sum_total_volumen();
	}
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(".res").parent().parent().parent().prev().append(content.replace(regexp, new_id));
  //$(link).parent().before(content.replace(regexp, new_id));
}


// Update Total Volumen for trainning exercises
function sum_total_volumen(){
	var volumen = 0;
	$.each($("tr.fields"), function(){
		if ($(this).css("display")!="none"){
			var rep 	= $(">#rep>input", this).val();
			var heat 	= $(">#heat>input", this).val();
			var dist 	= $(">#dist>input", this).val();

			if (rep=="") 	rep = 0;
			if (heat=="") heat = 0;
			if (dist=="") dist = 0;

			rep 	= parseInt(rep);
			heat 	= parseInt(heat);
			dist 	= parseInt(dist);

			if (isNaN(rep)||isNaN(heat)||isNaN(dist)) {
				volumen = "NaN"; //Poner en rojo la casilla debido a error
			} else {
				if (!isNaN(volumen)) { volumen += heat * rep * dist; };
			}	
		}
	});
	$("span.total_vol").text(volumen + " m");
};

// Update trial results fields with the correct value	
function change_value_trial_fields(name, unit){
	$.each($("tr.fields"), function(){
		if ($(this).css("display")!="none"){
			//Actualizar campo correspondiente
			$(this).children("#result_trial_category").text(name);
			$(this).children("#result_trial_category_type").text(unit);
		}
	});
};

$(function(){
	sum_total_volumen();

	$(".table_body").bind('keyup change', function() {
		sum_total_volumen();
	});

	$("td.remove a").click(function(){
		sum_total_volumen();
	});

	$("#trial_trial_category_id").bind('change', function(){
		var name = $(this).children(":selected").text()
		var unit = $(this).children(":selected").data("value");
		change_value_trial_fields(name, unit);
	});

	$("#filter").keyup(function(){
 
		// Retrieve the input field text and reset the count to zero
		var filter = $(this).val();

		// Loop through the comment list
		$("li.event").each(function(){
			// If the list item does not contain the text phrase fade it out
		  if ($(this).text().search(new RegExp(filter, "i")) < 0) {
			  $(this).fadeOut();
	      // Show the list item if the phrase matches and increase the count by 1
	    } else {
		    $(this).show();
		  }
		});
	});
});	