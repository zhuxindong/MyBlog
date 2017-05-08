<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<%@ page isELIgnored="false"%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script type="text/javascript" src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<title>管理员主页</title>
 	<style type="text/css">
 		#notsubmitstu{
 			width: 45%;
 			float: left;
 			overflow: true;

 		}

 		#hadsubmitstu{
 			width: 45%;
 			float: left;
 			overflow: true;
 			margin-left: 5%;
 		}
 	</style>
</head>
<body>
		<h1 style="margin-left: 30%">管理员界面</h1>
		<a href="logout">
				<button data-dismiss="modal" class="btn btn btn-info" type="submit" id="returnuserpage" 
            	style="margin-left: 70%;">退出登录</button>
		</a>
	
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <h2>班级人员打分情况统计：</h2>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
       		<div id="notsubmitstu">
       			<div class="panel panel-info">
				  <div class="panel-heading">已经打分的同学：</div>
				  <div class="panel-body">
				   	 	<s:iterator value="hadsubmitstu" var="p1">
							<tr>
					            <td>${p1[3]}</td>  <span><a href="showscore?username=${p1[1]}" target="blank">查看</a></span>                  
					        </tr>
					        <br>
						</s:iterator>
				  </div>
				</div>

       		</div>


       		<div id="hadsubmitstu">
       			<div class="panel panel-info">
				  <div class="panel-heading">还未打分的同学：</div>
				  <div class="panel-body">
					    <s:iterator value="notsubmitstu" var="p">
							<tr>
					            <td>${p[3]}</td>                     
					        </tr>
					        <br>
						</s:iterator>
				  </div>
				</div>
       		</div>



      </div>
    </div>
  </div>



  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <h2>实时打分结果统计：(已打分人数：${stu_scored})</h2>
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">

			<table class="table table-striped table-bordered table-hover  table-condensed" style="text-align: center; width: 80%">
				<tr class="info">
					<td rowspan="2">职务</td>
					<td colspan="5">得分</td>
				</tr>


				
				<tr class="bg-warning">
					
					<td>第一项</td>
					<td>第二项</td>
					<td>第三项</td>
					<td>第四项</td>
					<td>第五项</td>
				</tr>

				<!-- 班长 -->
				<tr>
					<td>班长</td>
					<s:iterator value="bz_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
					
				</tr>

				<!-- 团支书 -->
				<tr>
					<td>团支书</td>
					<s:iterator value="tzs_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
				</tr>

				<!-- 调宣委员 -->
				<tr>
					<td>调宣委员</td>
					<s:iterator value="dxwy_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
				</tr>


				<!-- 学习委员 -->
				<tr>
					<td>学习委员</td>
					<s:iterator value="xxwy_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
				</tr>


				<!-- 文体委员 -->
				<tr>
					<td>文体委员</td>
					<s:iterator value="wtwy_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
				</tr>


				
				<!-- 心理委员 -->
				<tr>
					<td>心理委员</td>
					<s:iterator value="xlwy_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
				</tr>


				<!-- 生活委员 -->
				<tr>
					<td>生活委员</td>
					<s:iterator value="shwy_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
				</tr>



				<!-- 资助委员 -->
				<tr>
					<td>资助委员</td>
					<s:iterator value="zzwy_ave" var="p">
							
					            <td>${p}</td>                     
					       
					        
					</s:iterator>
				</tr>



			</table>
			









      </div>
    </div>
  </div>


  



	
</body>
</html>