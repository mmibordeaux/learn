//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function () {

	var currentStudentIndex = -1;
	var students = $('.sync');

	function sync(student, onEnd) {
		var url = $(student).attr('href');
		var spinner = $(student).find('.fa');
		spinner.addClass('fa-spin');
		$.ajax({
			url: url,
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