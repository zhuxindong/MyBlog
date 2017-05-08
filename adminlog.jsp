<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">

<title>管理员界面</title>
</head>
<body>

		<h1 style="margin-left: 30%;
		margin-top: 5%;">管理员登录</h1>
		<div id="adminlogpage" >
		<div class="modal-dialog">
        <div class="modal-content" style="margin-left: -30%;margin-right: 30%;">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true" id="reload1">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">管理员登陆</h4>
          </div>



					<form action="adminlog" method="post">
						
						<div class="modal-body">
						<p>用户名:</p>
						<input type="text" class="form-control" name="adminusername">
						<br>
						<p>密码:</p> 
						<input type="password" class="form-control" name="adminpassword">
						
						</div>


						<div class="modal-footer">
          	
          
            <input type="submit" name="" class="btn btn-primary" value="登录">
            <!-- <button class="btn btn-default" type="button">提交</button> -->
          </div>
					</form>


				<s:fielderror />
		
				
          </form>
          
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
	</div>





	
	
</body>
</html>


<script type="text/javascript">
	$(function() {
	$("#adminlogpage" ).draggable();
    $("#adminlogpage").resizable();
  });
	
	
	$(function(){
		$("#reload1").click(function(){
		window.location.href="index.html";
	})

	});

</script>