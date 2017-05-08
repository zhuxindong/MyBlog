$(document).ready(function(){
    $("#logpage").hide();
    $("#regpage").hide();
   
  });


$(function(){

	$("#trylog").click(function(){
		$("#wel").hide();
		$("#logpage").fadeIn(500);
		// $("#logpage").toggle( "blind" );
	})
});

$(function(){

	$("#tryreg").click(function(){
		$("#wel").hide();
		$("#logpage").hide();
		$("#regpage").fadeIn(500);
		// $("#regpage").toggle( "clip" );
		// alert("1");
	})
});



$(function(){

	$("#reload1").click(function(){
		location.reload();
	})
});

$(function(){

	$("#reload2").click(function(){
		location.reload();
	})
});


$(function() {
    $("#logpage" ).draggable();
    $("#regpage" ).draggable();

    $("#logpage").resizable();
  });






//以下代码用ajax实现登陆功能
var xmlhttp;
	function log(){
		var logbtn=document.getElementById("logbtn");
		logbtn.disabled="disabled";//禁用按钮防止重复提交
		document.getElementById("tryagain").innerHTML="请2秒后重试";

	  var username = document.getElementById("lusername").value;
	  var password=document.getElementById("lpassword").value;
	  var par="username="+username+"&password="+password;
	  var url = "login.action";
	 
	  xmlhttp =new XMLHttpRequest(); 
	  xmlhttp.onreadystatechange=logResult; //响应函数
	  xmlhttp.open("POST",url,false);   //设置访问的页面
	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  xmlhttp.send(par);  //执行访问

	  setTimeout(btnactive,2000);
	}
	 
	function logResult(){
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		  console.log(xmlhttp.responseText);
		if (xmlhttp.responseText=="true") 
		{
			window.location.href="newwelcome.jsp";
		}
		else
		{
			document.getElementById('logResult').innerHTML=xmlhttp.responseText;
		}
	    
	  
	}
 
//2秒内禁用按钮，防止表单重复提交
 	function btnactive()
 	{
 		document.getElementById("logbtn").removeAttribute('disabled');
 		document.getElementById("tryagain").innerHTML="";
 	}




//用ajax实现实时查询用户名是否已经被注册
var xmlhttp;
	function check(){
	  var username = document.getElementById("rusername").value;
	  var url = "checkRegist.action?username="+username ;
	 
	  xmlhttp =new XMLHttpRequest(); 
	  xmlhttp.onreadystatechange=checkResult; //响应函数
	  xmlhttp.open("GET",url,true);   //设置访问的页面
	  
	  xmlhttp.send();  //执行访问
	}
	 
	function checkResult(){
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	  {
	  	console.log(xmlhttp.responseText);
	  	if (xmlhttp.responseText=="<font color='green'>可以使用</font>") 
	  	{
	  		document.getElementById('checkResult').innerHTML=xmlhttp.responseText;
	  		document.getElementById("reglogbtn").removeAttribute('disabled');
	  	}
	  	else
	  	{
	  		document.getElementById('checkResult').innerHTML=xmlhttp.responseText;
	  		document.getElementById("reglogbtn").disabled="disabled"
	  	}
	    
	  
	  }
		
	}
 
