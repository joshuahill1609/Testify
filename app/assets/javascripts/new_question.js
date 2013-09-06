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
  
  // gives "update" button on exam edit page functionality
	$("#exam-update").click(function(){
		$(".edit_exam").submit();
		return false;
	})

  
  //toggle add question nav bar on new_exam_url
  
  $(".add-question").click(function(){
    $(".add-question-bar").toggleClass("width-toggle")
    $(this).toggleClass("questions-toggle")
     setTimeout( function(){$(".question-options").toggleClass("questions-toggle")}, 350)
  })
  
  $(".close").click(function(){
    $(".add-question-bar").toggleClass("width-toggle")
    $(".add-question").toggleClass("questions-toggle")
    $(".question-options").toggleClass("questions-toggle")
  })
  
  // gives add question nav bar buttons functionality
  
  $("#mc-q").click(function(){
    $(".add-mc").trigger('click');
  })
  
  $("#tf-q").click(function(){
    $(".add-tf").trigger('click');
  })
  
  $("#es-q").click(function(){
    $(".add-es").trigger('click');
  })
  
  $(window).scroll(function(){
    if ( $(this).scrollTop() > 80 )
    {
    $(".add-question-bar").addClass("add-question-bar-fixed")
    }
   
    if ( $(this).scrollTop() < 80 )
    {
    $(".add-question-bar").removeClass("add-question-bar-fixed")
    }    
  })
  
  // tags display
  
  $(".tags-container ul li label").click(function(){
    $(this).toggleClass("tags-clicked");
  })
  
})//main closure