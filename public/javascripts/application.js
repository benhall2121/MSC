// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

	
var container_width, column_width, num_columns, column_array_heights = [], shortest = null, shortestIndex = 0;

function align_images(){

  $('.single_cake_wrapper').each(function(){
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
  
  $('.cakes_wrapper').css({
    height: Math.max.apply( null, column_array_heights )
  });
    	
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
		
  $('#new_message').live('submit', function(){
      //$.post(this.action, $(this).serialize(), null, function(response) { parent.$.fancybox.close(); });
      //$.fancybox.close();  
       //     event.preventDefault();
      parent.$.fancybox.close();	
      //return false;
  });
  
});

$(window).load(function() {
  align_images();
});
