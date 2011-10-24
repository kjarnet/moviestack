/* Skriv javascript direkte her (uten script-tags) */

/* Builds Json-object from form
 * (From http://stackoverflow.com/questions/1184624/serialize-form-to-json-with-jquery) 
 */
$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};


$.fn.stupidtext = function(event){

     alert("As you can see, the link no longer took you to jquery.com");
     event.preventDefault();
};

$.fn.editToggle = function(edit_movie){
	var new_form = $("div#new_form");
	var movie_forms = $('div[name^="movie_edit_form"]');
	var edit_form = $('div[name="movie_edit_form\\['+edit_movie+'\\]"]');
	var delete_form = $('div#delete_form');
	var movie_selects = $('input[name^="movie_select"]');
	
	movie_forms.hide();
	new_form.hide();
	delete_form.hide();
	movie_selects.hide();
	if(edit_movie==0) {
		new_form.show();
		delete_form.show();
		movie_selects.show();
	} else {
		edit_form.show();
	}
	
};

$.fn.findMovieId = function(buttonName){
	return $('input[name="' + buttonName + '"] ~ input[name^="movie_id"]').val();
}

$(document).ready(function(){

	var edit_movie = 1;
	$.fn.editToggle(0);
	$('input[name^="movie_edit"]').each(function(){
//		var buttonName = this.name;
		var movieId = $.fn.findMovieId(this.name);
			$(this).click(function(event){
			$.fn.editToggle(movieId);
			event.preventDefault();
		});
	});
	
	$('input[name^="movie_cancel"]').click(function(event){
		$.fn.editToggle(0);
		event.preventDefault();
	});

	



 });



