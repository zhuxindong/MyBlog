package com.ssh.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Score;
import com.ssh.model.Student;
import com.ssh.service.ScoreService;
import com.ssh.service.StudentService;



public class ScoreAction extends ActionSupport implements ServletRequestAware
														, ServletResponseAware{

	
	private HttpSession session;
	private HttpServletRequest request; 
	private HttpServletResponse response;
	
	
	private Student student=new Student();
	private Score score=new Score();
	
	private StudentService studentService;
	private ScoreService scoreService;
	
	
	
	//setter方法
	public void setScore(Score score) {
		this.score = score;
	}
	
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	
	
	
	
	//采用与servletAPI耦合的方式获取原生的session和request
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response=arg0;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
		//顺便获取session
		this.session=request.getSession();
	}
	
	
	//下面是各种服务方法
	//查询用户是否已经打过分数
	public String Issubmit() throws IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
			
		
		//获取session,以便确定是哪位用户在准备提交分数

		score=(Score) session.getAttribute("score");
		

		
		if (score!=null) 
		{
				
			if(score.getIsscored()==1)
			{
				System.out.println("已经打分1！");
				return "hadsubmit";
			}
			
			else
			{
				System.out.println("还未打分1！");
				return "neversubmit";
			}
		}
		
		else
		{
			System.out.println("还未打分1！");
			return "neversubmit";
		}
		
	}
	
	
	
	
	
	
	//提交打分结果
	public String Submitscore() throws IOException
	{

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
			
		
		//获取session,以便确定是哪位用户在准备提交分数

//		Student student=(Student) session.getAttribute("student");
		score=(Score) session.getAttribute("score");
		


		
		
		if(score.getIsscored()==1)
		{
			System.out.println("已经打分!");
			return "hadsubmit";
		}
		
		
		
		
		else
		{

			System.out.println("还未打分!");
			//获取表单参数并赋值给score对象
			Long tzs_1=Long.valueOf(request.getParameter("tzs_1"));	
			Long tzs_2=Long.valueOf(request.getParameter("tzs_2"));
			Long tzs_3=Long.valueOf(request.getParameter("tzs_3"));
			Long tzs_4=Long.valueOf(request.getParameter("tzs_4"));
			Long tzs_5=Long.valueOf(request.getParameter("tzs_5"));
			score.setTzs_1(tzs_1);
			score.setTzs_2(tzs_2);
			score.setTzs_3(tzs_3);
			score.setTzs_4(tzs_4);
			score.setTzs_5(tzs_5);
			
			
			
			Long bz_1=Long.valueOf(request.getParameter("bz_1"));
			Long bz_2=Long.valueOf(request.getParameter("bz_2"));
			Long bz_3=Long.valueOf(request.getParameter("bz_3"));
			Long bz_4=Long.valueOf(request.getParameter("bz_4"));
			Long bz_5=Long.valueOf(request.getParameter("bz_5"));
			score.setBz_1(bz_1);
			score.setBz_2(bz_2);
			score.setBz_3(bz_3);
			score.setBz_4(bz_4);
			score.setBz_5(bz_5);
			
			Long dxwy_1=Long.valueOf(request.getParameter("dxwy_1"));
			Long dxwy_2=Long.valueOf(request.getParameter("dxwy_2"));
			Long dxwy_3=Long.valueOf(request.getParameter("dxwy_3"));
			Long dxwy_4=Long.valueOf(request.getParameter("dxwy_4"));
			Long dxwy_5=Long.valueOf(request.getParameter("dxwy_5"));
			score.setDxwy_1(dxwy_1);
			score.setDxwy_2(dxwy_2);
			score.setDxwy_3(dxwy_3);
			score.setDxwy_4(dxwy_4);
			score.setDxwy_5(dxwy_5);
			
			Long xxwy_1=Long.valueOf(request.getParameter("xxwy_1"));
			Long xxwy_2=Long.valueOf(request.getParameter("xxwy_2"));
			Long xxwy_3=Long.valueOf(request.getParameter("xxwy_3"));
			Long xxwy_4=Long.valueOf(request.getParameter("xxwy_4"));
			Long xxwy_5=Long.valueOf(request.getParameter("xxwy_5"));
			score.setXxwy_1(xxwy_1);
			score.setXxwy_2(xxwy_2);
			score.setXxwy_3(xxwy_3);
			score.setXxwy_4(xxwy_4);
			score.setXxwy_5(xxwy_5);
			
			
			Long wtwy_1=Long.valueOf(request.getParameter("wtwy_1"));
			Long wtwy_2=Long.valueOf(request.getParameter("wtwy_2"));
			Long wtwy_3=Long.valueOf(request.getParameter("wtwy_3"));
			Long wtwy_4=Long.valueOf(request.getParameter("wtwy_4"));
			Long wtwy_5=Long.valueOf(request.getParameter("wtwy_5"));
			score.setWtwy_1(wtwy_1);
			score.setWtwy_2(wtwy_2);
			score.setWtwy_3(wtwy_3);
			score.setWtwy_4(wtwy_4);
			score.setWtwy_5(wtwy_5);
			
			Long xlwy_1=Long.valueOf(request.getParameter("xlwy_1"));
			Long xlwy_2=Long.valueOf(request.getParameter("xlwy_2"));
			Long xlwy_3=Long.valueOf(request.getParameter("xlwy_3"));
			Long xlwy_4=Long.valueOf(request.getParameter("xlwy_4"));
			Long xlwy_5=Long.valueOf(request.getParameter("xlwy_5"));
			score.setXlwy_1(xlwy_1);
			score.setXlwy_2(xlwy_2);
			score.setXlwy_3(xlwy_3);
			score.setXlwy_4(xlwy_4);
			score.setXlwy_5(xlwy_5);
			
			Long shwy_1=Long.valueOf(request.getParameter("shwy_1"));
			Long shwy_2=Long.valueOf(request.getParameter("shwy_2"));
			Long shwy_3=Long.valueOf(request.getParameter("shwy_3"));
			Long shwy_4=Long.valueOf(request.getParameter("shwy_4"));
			Long shwy_5=Long.valueOf(request.getParameter("shwy_5"));
			score.setShwy_1(shwy_1);
			score.setShwy_2(shwy_2);
			score.setShwy_3(shwy_3);
			score.setShwy_4(shwy_4);
			score.setShwy_5(shwy_5);
			
			
			Long zzwy_1=Long.valueOf(request.getParameter("zzwy_1"));
			Long zzwy_2=Long.valueOf(request.getParameter("zzwy_2"));
			Long zzwy_3=Long.valueOf(request.getParameter("zzwy_3"));
			Long zzwy_4=Long.valueOf(request.getParameter("zzwy_4"));
			Long zzwy_5=Long.valueOf(request.getParameter("zzwy_5"));
			score.setZzwy_1(zzwy_1);
			score.setZzwy_2(zzwy_2);
			score.setZzwy_3(zzwy_3);
			score.setZzwy_4(zzwy_4);
			score.setZzwy_5(zzwy_5);
			
			String evaluate=request.getParameter("evaluate");
			score.setEvaluate(evaluate);
			
			//设置为已经提交过表格
			score.setIsscored((long) 1);
			
			
			System.out.println("zhujian23333:"+score.getId());
			
			
			scoreService.updateScore(score);
			
			
			//更新session，设置为变更过的score
			session.removeAttribute("score");
			System.out.println("已经移除session");
			
			session.setAttribute("score", score);
			System.out.println("已经更新session");
			
			
			
			return "submitsuccess";
		}
	}
	
	

}
