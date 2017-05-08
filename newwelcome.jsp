<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/code_welcome.js"></script>
	<script type="text/javascript" src="js/islog.js"></script>
	<!-- <script type="text/javascript" src="http://zxd-1253592841.file.myqcloud.com/js/mymouse.js" id="mymouse"></script> -->
	<script type="text/javascript" src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/welcomestyle.css">
	<title>${sessionScope.student.getName()} 的个人主页</title>
</head>
<body >
	<!-- 吸顶的导航栏 -->
	
		<nav class="navbar navbar-default navbar-fixed-top" style="min-height: 40px;background-color:#0996D6;">
					
			
		    <div id="logout" class="infmation" style="float:right;  margin-top: 3px; margin-right: 25%; width:120px;">
				<form method="post" action="logout">
					<button data-dismiss="modal" class="btn btn-warning" type="submit" id="tryreg"
					style="margin-left: 20px;">退出登录</button>
				</form>
			</div>

			<div style="margin-right: 0px; float:right;  margin-top: 3px;">
				
				<button data-dismiss="modal" class="btn btn-info" type="button" id="chgpassword">修改密码</button>
			</div>


			<div style="margin-right: 10px;  margin-top: 8px;  float: right;">
				<font style="font-family: 微软雅黑 ;">${sessionScope.student.getName()} </font>
			</div>	

		</nav>
		
	<div id="bgp">
		<!-- 顶部的个人信息 -->
		<div id="userinfo">
			<div id="user_picture" >


				<div id="chgpic" style=" display: none;">
					<a href="javascript:void(0)" style="font-family: 微软雅黑 ;" id="achgpic">修改头像</a>
				</div>

				<!-- <div class="col-xs-3 " style="min-height: 124px; min-width: 124px;"> -->
				    <!-- <a href="#" class="thumbnail"> -->
				      <img src="user_picture/${sessionScope.student.getUsername()}.jpg"  onerror="this.src='user_picture/default.jpg' "
				style="height: 100%;width: 100%; border-radius: 10px;">
				    <!-- </a> -->
				<!-- </div> -->

				<!-- <img src="user_picture/${sessionScope.student.getUsername()}.jpg"  onerror="this.src='user_picture/default.jpg' "
				style="height: 100%;width: 100%; border-radius: 10px;"> -->

				
				

			</div>
			<div id="username">
				<font style="font-family: 微软雅黑 ; font-size: 40px;">${sessionScope.student.getName()} </font>
			</div>

			<div id="uploadpic" style="display: none;">

				<div class="panel panel-info">
				  <div class="panel-heading">修改头像</div>

				  <div class="panel-body">
				    	<form action="uploadpic" method="post" enctype="multipart/form-data" class="a-upload">
				 			<input type="hidden" name="username" value="${sessionScope.student.getUsername()}"/>
				 			<label class="fileLabel" for="uppic">选择图片</label>
						  	<input type="file" name="doc" id="uppic" style="display: none;" /> 
						  	<br> <br>
						 	<input type="submit"  class="btn btn-info" value="上传" style="width: 120px;" onclick="window.location.reload(true)">
						 	<button type="button" class="btn btn-default" style="width: 120px; margin-left: 30px;" id="cancel">取消</button>
						</form>
						
				  </div>
				</div>
				
			</div>


			<div id="chgpage"  style="display: none;">
				<div class="modal-dialog">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true" id="reload1">×</span><span class="sr-only">Close</span></button>
		            <h4 class="modal-title">修改密码</h4>
		          </div>

		          <form method="post" action="LogServlet">
		          	<div class="modal-body">
		          		<p>请输入新密码：</p>
		          		<input type="password" name="passsword1" class="form-control" required="" id="cpassword1">
		          		<br>
		          		<p>请再次输入:</p>
		          		<input type="password" name="password2" class="form-control" required="" id="cpassword2">
		          	</div>

		          	<div class="modal-footer">
		          	<span id="tryagain" style="color: red"></span>	<span id="chgResult"></span>  
		            <button data-dismiss="modal" class="btn btn-primary" type="button" onclick="chg()" id="chgbtn">确认修改</button>
		            <!-- <button class="btn btn-default" type="button">提交</button> -->
		          </div>
		          </form>
		          
		        </div><!-- /.modal-content -->
		      </div><!-- /.modal-dialog -->
			</div>

		</div>




		<!-- 左侧导航栏 -->
		<div id="left-nav">
			<ul class="nav navbar-default nav-stacked " style="width: 85%">
				<li><a href="newwelcome.jsp" class="list-group-item moduleItemLeft active">全部动态</a></li>
				<li><a href="my_newwelcome.jsp">我的动态</a></li>
				<li><a href="logscore">班委打分</a></li>				
				<li><a href="#">VB.Net</a></li>
				<li><a href="#">Java</a></li>
				<li><a href="#">PHP</a></li>
			</ul>


		</div>




		<!-- 主页信息 -->
		<div id="main-info">
			<!-- 发布动态的组件 -->
			<div id="input-text">
				<form action="publishMessage" method="post">
					<textarea  class="form-control" style="min-height: 82px;" id="saysomething">说点什么吧</textarea>
					<button type="button" class="btn" id="publishmessage" style="margin-left:500px; margin-top:3px;margin-right: 30px;width: 120px; position:absolute; z-index: 12;">发布</button>
				</form>
			</div>



			<div class="panel panel-default" id="newmessage" style="display: none; margin-top:18px;">
			  <div class="panel-heading">${sessionScope.student.getName()} <font style="float: right; margin-right: 5px;">刚刚</font></div>
			  <div class="panel-body" id="shownewmessage">
			    面板内容
			  </div>
			</div>

				<br>
									
					<s:iterator value="#application.messages" var="m">
						<div class="panel panel-default" id="msg_${id}">
						  <div class="panel-heading">${m.student.name} <font style="float: right; margin-right: 5px;">发表于：${m.createtime}</font>
						  <s:set name='username' value='#session.student.username'/>
						  <s:if test="#m.student.username==#username">
						  	<a href="javascript:void(0)" style="float: right;margin-right: 10px;" onclick="delmsg('${id}')">删除</a>
						  </s:if>
						  
						  </div>

						  <div class="panel-body">
						    ${m.content}
						  </div>

						</div>
					</s:iterator>
				
			







			
			

			
		</div>

			





		<!-- 右侧信息栏 -->
		<div id="right-info">
			
		</div>
	</div>

</body>
</html>