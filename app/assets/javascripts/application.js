//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function () {
	$('.sync').click(function(e){
		e.preventDefault();
		var url = $(this).attr('href');
		var spinner = $(this).find('.fa');
		spinner.addClass('fa-spin');
		$.ajax({
			url: url,
			success: function() {
				spinner.removeClass('fa-spin');
			}
		});
	})
});