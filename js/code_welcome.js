


$(function(){
   $("#user_picture").mouseover(function(){
   	
  		$("#chgpic" ).show();
	});

    $("#user_picture").mouseout(function(){
   	
  		$("#chgpic" ).hide();
	});


    $("#achgpic").click(function(){
		$("#uploadpic").show(500);
	});

	$("#cancel").click(function(){
		$("#uploadpic").hide(500);
	});
});



$(function(){

	$("#chgpassword").click(function(){
		// $("#userinformation").hide();
		// $("#score").hide();
		// $("#logout").hide();
		$("#chgpage").fadeIn(500);
		$("#publishmessage").hide();
		// $("#logpage").toggle( "blind" );
	})
});

var xmlhttp;
function chg(){
	var logbtn=document.getElementById("chgbtn");
	logbtn.disabled="disabled";
	document.getElementById("tryagain").innerHTML="请2秒后重试";

  var password1 = document.getElementById("cpassword1").value;
  var password2=document.getElementById("cpassword2").value;

  if (password1&&password2) 
  {

  	if (password1==password2) 
	  {
	  	  var par="&password1="+password1;
		  var url = "change.action";
		 
		  xmlhttp =new XMLHttpRequest(); 
		  xmlhttp.onreadystatechange=chgResult; //响应函数
		  xmlhttp.open("POST",url,true);   //设置访问的页面
		  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		  xmlhttp.send(par);  //执行访问

		  setTimeout(btnactive,2000);
	  }

	  else
	  {
	  		document.getElementById('chgResult').innerHTML="两次输入的密码不一致！";
	  		setTimeout(btnactive,2000);
	  }



  }


  else
  {
  		document.getElementById('chgResult').innerHTML="密码不能为空";
	  	setTimeout(btnactive,2000);
  }


  
  
}
 
function chgResult(){
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	  console.log(xmlhttp.responseText);
	if (xmlhttp.responseText=="true") 
	{
		window.location.href="newwelcome.jsp";
	}
	else
	{
		document.getElementById('chgResult').innerHTML="修改失败！未知原因";

	}
    
  
}

//2秒内禁用按钮，防止表单重复提交
	function btnactive()
	{
		document.getElementById("chgbtn").removeAttribute('disabled');
		document.getElementById("tryagain").innerHTML="";
		document.getElementById('chgResult').innerHTML="";
	}










$(function(){

	$("#reload1").click(function(){
		$("#chgpage").hide(500);
		$("#publishmessage").show();
	})
});


//用ajax实现发布动态的功能
$(function(){

	$("#publishmessage").click(function(){		
		// $("#newmessage").show(500);

		var newmessage=$("#saysomething").val();
		console.log(newmessage);

		$.ajax({
		url: 'publishMessage',
    	type: 'POST',
    	async:false,
    	// dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    	data: {"content": $("#saysomething").val()},
    	success:function(result)
    	{
    		console.log(result);
    		
    			$("#shownewmessage").text(newmessage);

    			$("#newmessage").show(500);
    		
    	}
    });


	});
});



//ajax实现无刷新删除动态的功能
var xmlhttp;
	function delmsg(del_id){
	

	  var par="del_id="+del_id;
	  var url = "deleteMessage.action";
	 
	  xmlhttp =new XMLHttpRequest(); 
	  xmlhttp.onreadystatechange=delResult; //响应函数
	  xmlhttp.open("POST",url,false);   //设置访问的页面
	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  xmlhttp.send(par);  //执行访问

	  setTimeout(btnactive,2000);
	}
	 
	function delResult(){
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		  console.log(xmlhttp.responseText);
		var msg_id="#msg_"+xmlhttp.responseText;
		console.log(msg_id);
		$(msg_id).hide(500);
	    
	  
	}















