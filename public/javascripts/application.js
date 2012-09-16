// This file is automatically included by javascript_include_tag :defaults
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
				if (!isNaN(volumen)) { volumen += rep * heat * dist; };
			}	
		}
	});
	$("span.total_vol").text(volumen + " m");
};
	
$(function(){
	sum_total_volumen();

	$(".table_body").bind('keyup change', function() {
		sum_total_volumen();
	});

	$("td.remove a").click(function(){
		sum_total_volumen();
	});
});

	