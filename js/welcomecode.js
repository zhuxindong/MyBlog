$(document).ready(function(){
  
    $("#chgpage").hide();
   
  });


$(function(){

	$("#chgpassword").click(function(){
		$("#userinformation").hide();
		$("#score").hide();
		$("#logout").hide();
		$("#chgpage").fadeIn(500);
		// $("#logpage").toggle( "blind" );
	})
});


$(function(){

	$("#reload1").click(function(){
		location.reload();
	})
});



//以下代码用ajax实现修改密码功能
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
			window.location.href="welcome.jsp";
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


