//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require star-rating/star-rating.min
//= require star-rating/locales/fr
//= require highcharts
//= require chartkick

$(document).ready(function () {

	var currentStudentIndex = -1;
	var students = $('.sync');

	function sync(student, onEnd) {
		var url = $(student).attr('href');
		var spinner = $(student).find('.fa');
		spinner.addClass('fa-spin');
		$.ajax({
			url: url,
            method: 'post',
			success: function() {
				spinner.removeClass('fa-spin');
				if (onEnd) {
					onEnd();
				}
			}
		});
	}

	function syncNextStudent() {
		currentStudentIndex++;
		var currentStudent = students[currentStudentIndex];
		if (currentStudent) {
			sync(currentStudent, syncNextStudent);
		} else {
			$('.promotion-sync .fa').removeClass('fa-spin');
		}
	}

	$('.sync').click(function(e){
		e.preventDefault();
		sync(this);
	})

	$('.promotion-sync').click(function(e) {
		e.preventDefault();
		var spinner = $(this).find('.fa');
		spinner.addClass('fa-spin');
		currentStudentIndex = -1;
		syncNextStudent();
	});

});
