$(document).ready(function() {
//adds questions
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




