$(document).ready(function(){

	$(".sortable").sortable();
	
	$("#exam_save").click(function(){
		$("#new_exam").submit();
		return false;
	})
	
});