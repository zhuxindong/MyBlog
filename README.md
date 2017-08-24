**

  这是博客系统的前端页面部分
-------------

**<br>

**前端部分共有以下网页**

 <br>
    1. index.html           //登录页面的首页。图片为必应首页的图片 <br>
    2. regerror.html        //因为恶意修改前端代码而导致注册失败的返回页<br>
    3. newwelcome.jsp       //主页，展现所有人的动态<br>
    4. my_newwelcome.jsp     //个人主页，展现自己的动态<br>
    5. score.jsp              //打分页面<br>
    6. scoredetails.jsp      //打分之后的展示页面<br>
    7. adminlog.jsp          //管理员登录页 <br>
    8. admin.jsp             //管理员主页 <br>
    9. showscore.jsp         //查看具体某个学生分数的页面 <br>
    
    


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
    
    
 上例演示了此项目用ajax与后台通信的方式，本项目的ajax实现基本均如上例所示，需注意的是，需要采用同步的方式来通信。
    
    


----------

各个页面与后台通信的url如下： （其实就是后台的action）
===============================
**1. index.html**
    

 - login.action: 
    用来登录，采用ajax实现
 - regist.action：
    用来注册，表单方式提交<br>
 `<form method="post" action="regist.action">` <br>
 - checkRegist.action：
    用来实时查询用户名是否已经被注册，采用ajax实现
    具体细节：为输入框绑定onkeyup方法，调用check()函数（在code.js中）,向checkRegist.action发送用户名信息进行查询，
	若被注册，则有提示信息并禁用注册按钮（同时后台也会做相应处理，防止恶意改变前端代码实现重复注册）

**2.newwelcom.jsp**
     这是用户主页，用户个人信息放在session域，所有人的动态放在application域，权限控制由EL表达式实现
     头像：用户头像的实现方式比较特殊，在服务器目录下有一个user_picture文件夹专门用于存放用户头像，
     而不是存储在数据库中。用户的默认头像都是default.jpg，当用户上传头像后，就会改成${username}.jpg 。
    （注：此处并不是很好的解决方案，因为如果用户名含有特殊字符，如："<"、">"等，会匹配掉html标签，导致页面显示不正常）
