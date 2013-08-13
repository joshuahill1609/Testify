$(document).ready(function(){
	
	//makes each question sortable on exam build page
	$(".sortable").sortable();
	
	// gives "save" button on exam build page functionality
	$("#exam_save").click(function(){
		$("#new_exam").submit();
		return false;
	})
	

})