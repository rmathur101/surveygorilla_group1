$(document).ready(function() {
    //create three initial fields

//add a new node
    var $node = "";
    var startingNo = 1;
    for(var varCount=0;varCount<=startingNo;varCount++){
        var displayCount = varCount+1;
        var node =""
        $node += '<ul><label>Question '+displayCount+': </label><input type="text" name="question_'+displayCount+'" >';
        var startingNoChoice = 1;
        for(var choiceCount=0;choiceCount<=startingNoChoice;choiceCount++){

            var displayChoiceCount = choiceCount+1;
            $node += '<li><label>Choice '+displayChoiceCount+': </label><input type="text" name="choice_'+displayChoiceCount+'" id="choice_'+displayChoiceCount+'"><span class="removeChoice">Remove Choice</span></li>';

        }
        $node += '<p><span class="addChoice">Add Choice</span>';
        $node += '</p>';
        $node += '<span class="removeQuestion">Remove Question</span></ul>';
    }

//add them to the DOM
    $('#questions').prepend($node);

//remove a question
    $('#questions').on('click', '.removeQuestion', function(){
        $(this).parent().remove();
    });
//remove a choice
    $('#questions ul').on('click', '.removeChoice', function(){
        $(this).parent().remove();

    });


//add a new question
    $('#addQuestion').on('click', function(){
        varCount++;
        $node += '<ul><label>Question '+varCount+': </label><input type="text" name="question_'+varCount+'" id="question_'+varCount+'">';
        for(var choiceCount=0;choiceCount<=startingNoChoice;choiceCount++){

            var displayChoiceCount = choiceCount+1;
            $node += '<li><label>Choice '+displayChoiceCount+': </label><input type="text" name="choice_'+displayChoiceCount+'" id="choice_'+displayChoiceCount+'"><span class="removeChoice">Remove Choice</span></li>';

        }
        $node += '<span class="removeQuestion">Question Choice</span></ul>'
        $(this).parent().before($node);
    });
//add a new choice
    $('.addChoice').on('click', function(){
        varCount++;
        $node = '<li><label>Choice '+varCount+': </label><input type="text" name="choice_'+varCount+'" id="choice_'+varCount+'"><span class="removeChoice">Remove Choice</span></li>';
        $(this).parent().before($node);
    });



});
