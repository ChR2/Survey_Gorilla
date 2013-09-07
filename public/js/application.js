$(document).ready(function() {
  //adds questions
    setInterval(function() {
  $("#answer input[type=text]").each(function() {
     var element = $(this);
     if (element.val() !== "") {
       $(this).css({
         boxShadow: 'inset 8px 0px 0  #515255',
         paddingLeft: '12px'})
     }
     var element = $(this);
     if (element.val() == "") {
         $(this).css('border-left', '1px solid #ccc')
     }
  });  
  }, 200);

  $('#addVar').on('click', function(){
    $.get('/question/new', function(response){
      $('#question #addVar').before(response);
    });
  });

  //remove questions   
  $('#question').on('click','.removeVar', function(){
   $(this).parent().remove();
  });

  // adds answers
  $('#question').on('click','#addAns',function(){
    $.get('/answer/new', function(response){
      $('.question_section:last #addAns').before(response);
    })
  });


  //removes answers
  $('#question').on('click','.removeAns',function(){
    $(this).parent().remove();
  });

});




