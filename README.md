**

这是博客系统的前端页面部分
-------------

**<br>

**前端部分共有以下网页**

<br>
    1. index.html     //登录页面，首页 <br>
    2. regerror.html   //因为恶意修改前端代码而导致注册失败的返回页<br>
    3. newwelcome.jsp   //主页，展现所有人的动态<br>
    4. my_newwelcome.jsp    //个人主页，展现自己的动态<br>
    5. score.jsp        //打分页面<br>
    6. scoredetails.jsp     //打分之后的展示页面<br>
    7. adminlog.jsp     //管理员登录页<br>
    8. admin.jsp        //管理员主页<br>
    9. showscore.jsp        //查看具体某个学生分数的页面<br>
    
    


----------
## 各个页面的布局架构 ##

 

 - index.html
=============
 - 登录

    登录由ajax实现，登录按钮绑定了onclick方法
    `<button data-dismiss="modal" class="btn btn-primary"`             ` type="button" onclick="log()" id="logbtn">登陆</button>`
    log（）函数如下：
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

    
    