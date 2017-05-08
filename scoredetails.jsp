<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/islog.js"></script>

<title>${sessionScope.student.getName()}的打分结果</title>
</head>
<body>
	<div id="tit">
		<div id="tit1">
			<h1 >您已打分，结果如下：</h1>
		</div>
		<div id="btns">
			<a href="returnuserpage">
				<button data-dismiss="modal" class="btn btn-default" type="submit" id="returnuserpage" 
            	style="margin-left: 272px;margin-top: 52px;">返回主页</button>
			</a>
			
			<a href="logout">
				<button data-dismiss="modal" class="btn btn btn-info" type="submit" id="returnuserpage" 
            	style="margin-left: 20px;margin-top: 52px;">退出登录</button>
			</a>

            
		</div>
	</div>
	
	<div id="scoreform">
		<h2 style="font-family: 楷体; text-align:center">信息学院班干部期末评分表（班级同学考核部分）</h2>
			
		<form>
			<b style="margin-left: 20px;">一、共同标准（20分）</b>
			<table border="1" class="table table-striped table-bordered table-hover  table-condensed" >
				<!-- 第一行 -->
				<tr style="text-align: center;">
					<!-- <td></td> -->
					<td colspan="2" style="text-align: center;">评    分    内    容</td>
					<td>团<br>支<br>书</td>
					<td>班<br>长</td>
					<td>调<br>宣<br>委<br>员</td>
					<td>学<br>习<br>委<br>员</td>
					<td>文<br>体<br>委<br>员</td>
					<td>心<br>理<br>委<br>员</td>
					<td>生<br>活<br>委<br>员</td>
					<td>资<br>助<br>委<br>员</td>
				</tr>
				<!-- 第二行 -->
				<tr>
					<td style="width: 50px ;height: 76px;">
							工作积极性(10’)
					</td>
					<td style="width: 540px">
						<div>1．很好地完成日常工作，积极主动地开展各项活动并有所创新。 (8~10分)</div>
						<div>2．较好地完成日常工作，较为积极地组织开展各项活动。        (6~7分)</div>
						<div>3．基本完成日常工作，被动地组织开展一些活动。              (3~5分)</div>
						<div>4．不能完成日常工作，工作马虎，敷衍了事。                (3分以下)</div>
					</td>
					<td>
						<!-- <input  type="number" required="" step="1" min="0" max="10" name="tzs_1" class="form-control"  > -->
						<div class="scoreresult">${sessionScope.score.getTzs_1()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="bz_1" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getBz_1()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="dxwy_1" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getDxwy_1()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xxwy_1" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXxwy_1()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="wtwy_1" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getWtwy_1()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xlwy_1" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXlwy_1()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="shwy_1" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getShwy_1()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="zzwy_1" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getZzwy_1()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td style="width: 50px">
						同学反映(10’)
					</td>
					<td style="width: 540px">
						<div>1．	与同学关系融洽，同学对其工作表现较为满意。(8~10分)</div>
						<div>2．	与同学关系一般，同学对其工作表现基本满意。 (4~7分)</div>
						<div>3．与同学关系不融洽，同学对其工作不满意。(4分以下)</div>

					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="tzs_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getTzs_2()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="bz_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getBz_2()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="dxwy_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getDxwy_2()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xxwy_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXxwy_2()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="wtwy_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getWtwy_2()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xlwy_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXlwy_2()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="shwy_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getShwy_2()}</div>
					</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="zzwy_2" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getZzwy_2()}</div>
					</td>
				</tr>

			</table>

			<br>

			<b style="margin-left: 20px;"> 二、单独分（30分） </b>
			
			<table border="1" style="text-align: center;" class="table table-striped table-bordered table-hover  table-condensed">
				<!-- 第一行  团支书 -->
				<tr style="text-align: center;" class="info">
					<th style="text-align: center; width: 100px">职务</th>
					<th style="text-align: center; width: 865px;">评分内容</th>
					<th style="text-align: center; width: 222px">得分</th>
				</tr>
				<!-- 第二行 -->
				<tr style="text-align: center;">
					<td rowspan="3">团支书</td>
					<td>1．协助党建联系人搞好本班党建工作。  （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="tzs_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getTzs_3()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>2．组织一些团日活动，形式新颖，内容健康向上。  （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="tzs_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getTzs_4()}</div>
					</td>
				</tr>
				<!-- 第四行 -->
				<tr>
					<td>3．搞好团支部内部建设，保证党章学习小组正常有序运行  （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="tzs_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getTzs_5()}</div>
					</td>
				</tr>
				
				<!-- 班长 -->
				<!-- 第一行 -->	
				<tr style="text-align: center;">
					<td rowspan="3">班长</td>
					<td>1．增强班级凝聚力，扩大班级影响，妥善处理突发事件。  （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="bz_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getBz_3()}</div>
					</td>
				</tr>
				
				<!-- 第二行 -->
				<tr>
					<td>2．协调班委之间的工作，调动班委工作积极性，配合班主任的工作。   （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="bz_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getBz_4()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>3．在思想学习等方面起带头作用，并能当好学生与老师的桥梁。     （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="bz_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getBz_5()}</div>
					</td>
				</tr>

				<!-- 调宣委员 -->
				<!-- 第一行 -->	
				<tr style="text-align: center;">
					<td rowspan="3">调宣委员</td>
					<td>1．对班级的宣传等工作。  （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="dxwy_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getDxwy_3()}</div>
					</td>
				</tr>
				
				<!-- 第二行 -->
				<tr>
					<td>2．主动了解同学之间的思想动态，并及时向学院汇报。    （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="dxwy_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getDxwy_4()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>3．把学院的新政策及当前热点问题反馈给同学。  （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="dxwy_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getDxwy_5()}</div>
					</td>
				</tr>

				
				<!-- 学习委员 -->
				<!-- 第一行 -->	
				<tr style="text-align: center;">
					<td rowspan="3">学习委员</td>
					<td>1．对同学学习状况的了解,并加以措施对其进行调整,培养班级学习气氛。   （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xxwy_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXxwy_3()}</div>
					</td>
				</tr>
				
				<!-- 第二行 -->
				<tr>
					<td>2．学习成绩在班中保持优良名次。    （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xxwy_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXxwy_4()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>3．自身学习态度端正。  （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xxwy_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXxwy_5()}</div>
					</td>
				</tr>


				<!-- 文体委员 -->
				<!-- 第一行 -->	
				<tr style="text-align: center;">
					<td rowspan="3">文体委员</td>
					<td>1．督促班级成员参加早锻炼。   （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="wtwy_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getWtwy_3()}</div>
					</td>
				</tr>
				
				<!-- 第二行 -->
				<tr>
					<td>2．对班级同学在文艺、体育方面特长的发现并为其提供一些机会，促其在这些特长上的发展。    （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="wtwy_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getWtwy_4()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>3．组织同学参加校院和班级之间的文体活动以及班里的特色活动。  （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="wtwy_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getWtwy_5()}</div>
					</td>
				</tr>
				

				<!-- 心理委员 -->
				<!-- 第一行 -->	
				<tr style="text-align: center;">
					<td rowspan="3">心理委员</td>
					<td>1.营造班级积极健康的心理文化氛围，开展班级心理健康主题教育活动。    （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xlwy_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXlwy_3()}</div>
					</td>
				</tr>
				
				<!-- 第二行 -->
				<tr>
					<td>2.了解班级同学的心理状况，并定期向学院反馈。     （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xlwy_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXlwy_4()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>3.主动关心有特别表现（情绪持续低落，行为反常大等）的同学。  （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="xlwy_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getXlwy_5()}</div>
					</td>
				</tr>

				
				<!-- 生活委员 -->
				<!-- 第一行 -->	
				<tr style="text-align: center;">
					<td rowspan="3">生活委员</td>
					<td>1．及时发放票据，班费记录清晰，如收支不平衡且不能解释的本项得分为0。  （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="shwy_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getShwy_3()}</div>
					</td>
				</tr>
			
				<!-- 第二行 -->
				<tr>
					<td>2．关心同学生活，及时向学院反映同学生活上的困难。   （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="shwy_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getShwy_4()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>3．作好走读生与住读生桥梁，及时将校院班情况通知走读生。   （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="shwy_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getShwy_5()}</div>
					</td>
				</tr>


				<!-- 资助委员 -->
				<!-- 第一行 -->	
				<tr style="text-align: center;">
					<td rowspan="3">资助委员</td>
					<td>1．熟悉并及时传达相关政策。  （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="zzwy_3" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getZzwy_3()}</div>
					</td>
				</tr>
			
				<!-- 第二行 -->
				<tr>
					<td>2．了解同学生活及心理上的状况，并及时向学院老师反映。   （10分）</td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="zzwy_4" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getZzwy_4()}</div>
					</td>
				</tr>
				<!-- 第三行 -->
				<tr>
					<td>3．主动关心并且帮助有需要的同学。   （10分） </td>
					<td>
						<!-- <input type="number" required="" step="1" min="0" max="10" name="zzwy_5" class="form-control"> -->
						<div class="scoreresult">${sessionScope.score.getZzwy_5()}</div>
					</td>
				</tr>
			</table>
			<br>
			<b style="margin-left: 20px;">三、点评（您可在该项中对您所在班级任何一位班干部做出简要、全面、公正的评价，可自由发挥）</b>

			<textarea  class="form-control" style="height: 175px;width: 1160px; margin: 6px auto; font-family: 华文行楷; font-size: 20px;" name="evaluate">
				${sessionScope.score.getEvaluate()}
			</textarea>

			
            <!-- <button data-dismiss="modal" class="btn btn-primary" type="submit" id="submitbtn" 
            style="margin: 20px 200px;width: 344px;height: 71px;" onclick="dev()">提交</button> -->
            	
          	
		</form>

		
		

	</div>




</body>
</html>