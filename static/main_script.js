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

$.fn.editToggle = function(edit_movie){
	var new_form = $("div#new_form");
	var movie_forms = $('div[name^="movie_edit_form"]');
	var edit_form = $('div[name="movie_edit_form\\['+edit_movie+'\\]"]');
	var delete_form = $('div#delete_form');
	var movie_selects = $('input[name^="movie_select"]');
	//var form_main = $('form#form_main'); //Unneccesary

	movie_forms.hide();
	new_form.hide();
	delete_form.hide();
	movie_selects.hide();
	if(edit_movie==0) {
		new_form.show();
		delete_form.show();
		movie_selects.show();
		//form_main.attr("target","new"); //Unneccesary
	} else {
		edit_form.show();
		//form_main.attr("action","movie/"+edit_movie+"/update/"); //Unneccesary
	}
	
};

// TODO: Find a more reliable way to find the movie-id
/*$.fn.findMovieId = function(buttonName){
	return $('input[name="' + buttonName + '"] ~ input[name^="movie_id"]').val();
}
*/
$.fn.findMovieId = function(){
	return this.closest('li#movie_list').children('input[name^="movie_id"]').first().val();
}

$(document).ready(function(){

	var edit_movie = 1;
	$.fn.editToggle(0);
	$('input[name^="movie_edit"]').each(function(){
		//var movieId = $.fn.findMovieId(this.name);
		var movie_id = $(this).findMovieId();
		$(this).click(function(event){
			$.fn.editToggle(movie_id);
			event.preventDefault();
		});
	});

	$('input[name^="movie_update"]').each(function(){
		//var movie_id = $.fn.findMovieId(this.name);
		var movie_id = $(this).findMovieId();
		var json_movie = "{title:\"test\"}";
		var get_url = "movie/"+movie_id+"/update/";
		$(this).click(function(event){
			alert("Sending json to "+get_url);
			$.getJSON(get_url,json_movie,function(data,textStatus,jqXHR){
				alert("Success:"+data.title);
			})
			.success(function() { alert("second success"); })
			.error(function(data,textStatus,jqXHR) { alert("error:"+textStatus); })
			.complete(function() { alert("complete"); });;
			//event.preventDefault();
		});
	});
	
	$('input[name^="movie_cancel"]').click(function(event){
		$.fn.editToggle(0);
		event.preventDefault();
	});

	



 });



