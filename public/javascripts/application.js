// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});
	
var container_width, column_width, num_columns, column_array_heights = [], shortest = null, shortestIndex = 0, which = '', incoming = '';

function align_images(){

  $('.single_cake_wrapper:visible').each(function(){
    height_of_item = $(this).height() + parseInt($(this).css("padding-top")) + parseInt($(this).css("padding-bottom")) + parseInt($(this).css("margin-top")) + parseInt($(this).css("margin-bottom"));
   
    shortest = Math.min.apply( null, column_array_heights );
    shortestIndex = column_array_heights.indexOf(shortest);
    
    $(this).css({
      position: 'absolute',
      top: column_array_heights[shortestIndex]+'px',
      left: (shortestIndex*column_width)+'px'	    
    });
    
    column_array_heights[shortestIndex] += height_of_item;
  	
  });
  
  $('.single_cake_wrapper:hidden').each(function(){
    $(this).children().find('.pop').attr('rel', 'gallery_none');
  });
  
  $('.cakes_wrapper').css({
    height: Math.max.apply( null, column_array_heights )
  });
    	
}

function refresh_view(){
	
  for(rv = 0; rv < column_array_heights.length; rv++) {
    column_array_heights[rv] = 0;
  }
  
  align_images();
}

function reset_view(){
	
  $('.single_cake_wrapper').show();
  $('body').css('background-color','#E1E1E1');
  $('.main_logo').attr('src','/images/logo50.png');
  $('.text_parties').removeClass("purple");
  $('.text_weddings').removeClass("pink");
  $('.text_special_occassions').removeClass("teal");
  $('.pop').attr('rel', 'gallery');

}

function getParameterByName(name)
{
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regexS = "[\\?&]" + name + "=([^&#]*)";
  var regex = new RegExp(regexS);
  var results = regex.exec(window.location.href);
  if(results == null)
    return "";
  else
    return decodeURIComponent(results[1].replace(/\+/g, " "));
}

var currently_loading = false;

function add_more_cakes(){
  if(!currently_loading){
    $('.load_more_cakes').hide();	  
    $("#loader").show();
    currently_loading = true;
    var count = $('.single_cake_wrapper').length;
    $.get("get_more?count=" + count, null);
  }
}

$(document).ready(function() {

  container_width = $('.cakes_wrapper').width() - parseInt($('.cakes_wrapper').css("padding-right")) - parseInt($('.cakes_wrapper').css("padding-right"));
  column_width = $('.single_cake_wrapper').width() + parseInt($('.single_cake_wrapper').css("padding-right")) + parseInt($('.single_cake_wrapper').css("padding-right")) + parseInt($('.single_cake_wrapper').css("margin-right")) + parseInt($('.single_cake_wrapper').css("margin-left"));
	
  num_columns = Math.floor(container_width/column_width);
  //length of column will equal num_columns
  column_array_heights = [];
  while(column_array_heights.length < num_columns){ column_array_heights.push(0);}
  
  // Find the shortest column.
  shortest = null;
  shortestIndex = 0;		
	
  $(".pop").attr('rel', 'gallery').fancybox({
	'width'				: '75%',
	'height'			: '100%',
	'autoScale'			: false,
	'transitionIn'		: 'elastic',
	'transitionOut'		: 'elastic',
	'centerOnScroll'	: 'true',
	'cyclic'		: 'true',
	'titleShow'		: 'true'
  });
  
  $('#new_message').live('submit', function(){
      //$.post(this.action, $(this).serialize(), null, function(response) { parent.$.fancybox.close(); });
      //$.fancybox.close();  
       //     event.preventDefault();
      parent.$.fancybox.close();	
      //return false;
  });
  
  $('.text_parties').click(function(){
    reset_view();
    
    $('.wedding').parent().hide();
    $('.special').parent().hide();
    
    $('.text_parties').addClass("purple");
    $('body').css('background-color','#D5CFE8');
    $('.main_logo').attr('src','/images/logoPurple50.png');
    
    refresh_view();
  });
  
  $('.text_weddings').click(function(){
    reset_view();
    
    $('.parties').parent().hide();
    $('.special').parent().hide();
    
    $('.text_weddings').addClass("pink");
    $('body').css('background-color','#FBD5E2');
    $('.main_logo').attr('src','/images/logoPink50.png');
    
    refresh_view();
  });
  
  $('.text_special_occassions').click(function(){
    reset_view();
    
    $('.wedding').parent().hide();
    $('.parties').parent().hide();
    
    $('.text_special_occassions').addClass("teal");
    //$('body').css('background-color','#FBD5E2');
    //$('.main_logo').attr('src','/images/logoPink50.png');
    
    refresh_view();
  });
  
  $('.logo').click(function(){
    reset_view();
    refresh_view();
  });
  
  $(window).scroll(function () { 
    if ($(window).scrollTop() > $('body').height() / 4) {
      add_more_cakes();
    } 
  });
  
  $('.load_more_cakes').click(function(){
    add_more_cakes();	  
  });
  
});

$(window).load(function() {
		
  incoming = getParameterByName('which');
  
  which_cakes()
});

function which_cakes(){
  if(which == '' && incoming != ''){
    which = incoming;
    
    if(incoming == 'wedding'){
      $('.text_weddings').trigger("click");
    } else if(incoming == 'parties') {
      $('.text_parties').trigger("click");
    } else if(incoming == 'special') {
      $('.text_special_occassions').trigger("click");
    }	  
  } else {			
    refresh_view();
  }	
}
