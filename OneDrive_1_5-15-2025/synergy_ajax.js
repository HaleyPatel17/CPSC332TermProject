function synergy_ajax_get_request() {
	var ajaxRequest;  // The variable that makes Ajax possible!	
	try { ajaxRequest = new XMLHttpRequest();} // Opera 8.0+, Firefox, Safari
	catch (e) {		
	  try { ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP"); } // Internet Explorer Browsers
    catch (e) {
  		try { ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");} // Something went wrong
      catch (e) {
		    alert("Your browser broke!");
		    return false;
	    }
	  }
  }
  return ajaxRequest;	
}	

function synergy_ajax_send_get_json_string(send_url, response_function, extra_variables) {
  //alert('synergy_ajax_send_get_json_string');
  var ajaxRequest = synergy_ajax_get_request();

  // Create a function that will receive data sent from the server
  ajaxRequest.onreadystatechange = function() {
    if(ajaxRequest.readyState == 4){  	//	  alert('ajaxRequest.responseText='+ajaxRequest.responseText);		
      var eval_func = response_function + "(ajaxRequest.responseText";	  	  
	  if( Object.prototype.toString.call(extra_variables) === '[object Array]' ) {
	    for (var name in extra_variables) {
          eval_func = eval_func + ",extra_variables['" + name + "']";
        }	 
      }	  	  
	  eval_func = eval_func + ');';
	  eval(eval_func); 	  	  
	}
  }
	
	
 // alert('synergy_ajax_send_get_json_string send_url=' + send_url);	
	
  ajaxRequest.open("GET", send_url, true);				
  ajaxRequest.send(null); 
}

function synergy_ajax_send_post_json_object(form_id, send_url, response_function) {
  dataString = $("#" + form_id).serialize();  
  
  $.ajax({
    type: "POST",
    url: send_url,
    data: dataString,
    dataType: "json",			
    success: function(data) {	  	
      var eval_func = response_function + '(data);'; 	  
	    eval(eval_func); 	  
    }           
  });      
}

function synergy_ajax_send(target_url,response_function,get_or_post,form_id) {   			
  form_id = form_id || "form_synergy";
  if (get_or_post == 'post') {	
 // alert('synergy_ajax_send post target_url=' + target_url);  
    synergy_ajax_send_post_json_object(form_id,target_url,response_function);  	
  } else { 	  
 // alert('synergy_ajax_send get target_url=' + target_url);    
    var extra_variables = new Array();
    extra_variables['response_function'] = response_function;  			
    synergy_ajax_send_get_json_string(target_url,"synergy_ajax_response_string",extra_variables);								   
  }    
}

function synergy_ajax_response_string(json_response_string,response_function) { 
  var json_ret_val = jQuery.parseJSON(json_response_string);    	 
 
  if (!json_ret_val || typeof(json_ret_val.no_display) == "undefined" || json_ret_val.no_display === null) {	
	  eval(response_function + '(json_ret_val);'); 	 			
  }    
 /*
  if (typeof(json_ret_val.no_display) == "undefined" || json_ret_val.no_display === null) {	
	  eval(response_function + '(json_ret_val);'); 	 			
  }    */
}



