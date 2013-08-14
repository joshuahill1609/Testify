$(document).ready(function(){
	
	//makes each question sortable on exam build page
	$(".sortable").sortable({
		axis: 'y',
		stop: function(event, ui){
			 $(".question_item").each(function(){
				 var index = $(this).index() + 1;
				 $(this).find(".question_position").val(index);
			 });
		}
	});
	
	// gives "save" button on exam build page functionality
	$("#exam_save").click(function(){
		$("#new_exam").submit();
		return false;
	})
	

})