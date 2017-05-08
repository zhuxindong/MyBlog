$(document).ready(function(){
    
    $.ajax({
    	url: 'isLogin',
    	type: 'POST',
    	async:false,
    	// dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    	// data: {param1: 'value1'},
    	success:function(result)
    	{
    		if (result=="false") 
    		{
    			alert("您还未登录或登录已过期，请重新登录!");
    			console.log("您还未登录或登录已过期，请重新登录!");
    			window.location.href="index.html"
    		}
    	}
    })
    

    




   
  });