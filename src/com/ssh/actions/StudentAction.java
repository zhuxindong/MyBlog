package com.ssh.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Student;
import com.ssh.service.MessageService;
import com.ssh.service.ScoreService;
import com.ssh.service.StudentService;

import com.ssh.dao.ScoreDAO;
import com.ssh.model.Message;
import com.ssh.model.Score;

public class StudentAction extends ActionSupport implements ServletRequestAware,
															ServletResponseAware{
	
	private HttpSession session;
	private HttpServletRequest request; 
	private HttpServletResponse response;
	private ServletContext application;
	
	
	private Student student=new Student();
	private Score score=new Score();
	
	private StudentService studentService;
	private ScoreService scoreService;
	private MessageService messageService;
	
	
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

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
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
		this.application=session.getServletContext();
		
	}
	
	
	

	
	
	
	
	
	//下面是各种服务方法
	//查询用户是否已经被注册
		public void isRegist() throws IOException
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			//获取表单参数
			String username=request.getParameter("username");
			
			System.out.println("用户名cao:"+username);
			
			if (!username.equals("")) 
			{
				List<Student> stu=this.studentService.findStudent(username);//返回查询结果集
				//判断是否被注册并返回相应信息
				if (!stu.isEmpty()) 
				{
					out.print("<font color='red'>用户名已被注册！</font>");
					System.out.println("用户名已经被注册!");
				} 
				else 
				{
					out.print("<font color='green'>可以使用</font>");
					System.out.println("用户名未注册，可以使用!");

				}
				
				
				
			} else {
				out.print("<font color='red'>用户名不能为空!</font>");
				System.out.println("用户名不能为空!");

			}
				
			
		}
	
	
	
		
		
		//实现用户登陆
		public void Login() throws IOException
		{
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			//获取表单参数
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			
			//返回查询结果集
			List<Student> stu=this.studentService.findStudent(username);
			
			//如果用户名存在，则检查密码是否正确
			if (!stu.isEmpty()) 
			{
				if (stu.get(0).getPassword().equals(password))
				{
					out.print("true");
//					this.session=request.getSession();
					session.setAttribute("student", stu.get(0));
					
					//在application中加入所有人的动态
					System.out.println("messages:"+messageService.findallMessage().get(0).getCreatetime());
					
					List<Message> messages=messageService.findallMessage();
					List<Message> mymessages=messageService.findMessagebystudent((Student) session.getAttribute("student"));
					Collections.sort(messages);
					Collections.sort(mymessages);
					
					
					application.setAttribute("messages",messages);
					session.setAttribute("mymessages", mymessages);
					
					System.out.println("跳转成功!");
					
					//如果还没有score表的记录，那就创建一条记录
//					System.out.println("5555"+stu.get(0).getScore().getId());
				if (stu.get(0).getScore() == null) {
						
//						
						score.setStudent(stu.get(0));
						score.setIsscored((long) 0);
						
						scoreService.saveScore(score);
						
						session.setAttribute("score", score);
					}
					
					else
					{
						session.setAttribute("score", stu.get(0).getScore());
					}
					
					
					
					
					
				} 
				else 
				{
					out.print("<font color='red'>用户名或密码错误!</font>");
					System.out.println("2用户名或密码错误!");
				}
				
				
			} 
			
			else 
			{
				out.print("<font color='red'>用户名不存在!</font>");
				System.out.println("1用户名不存在!");
			}
			
			
			
		}
		
		
		
		
		
		//查询是否用户是否已经登录
		public void isLogin() throws IOException
		{
			//与servletAPI耦合的方式，获取request和response对象

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			//获取session
//			this.session=request.getSession();
			if (session.getAttribute("student")==null) {
				out.print("false");
			}
			
			else
			{
				out.print("true");
			}
			
		}
		
		
		
		
		
		
		
		//实现退出登录
		public String  Logout()
		{
			
			session.removeAttribute("student");
			session.removeAttribute("score");
			session.removeAttribute("mymessages");
			
			System.out.println("一位用户退出");
			return "logoutsuccess";
		}
		
		
		
		
		
		//实现修改密码
		public void Changepassowrd() throws IOException
		{

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			//获取表单参数
			String password=request.getParameter("password1");
			//获取session
//			HttpSession session=request.getSession();
			//取得session中的用户
			Student student =(Student) session.getAttribute("student");
			student.setPassword(password);
			
			
			this.studentService.updateStudent(student);
			
			session.removeAttribute("student");
			session.setAttribute("student", student);
			
			out.print("true");
				
				
		}
		
		
		
		//实现注册功能
		public String Regist() throws IOException
		{
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			//获取表单参数
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String sex=request.getParameter("sex");
			
			
			//防止有人恶意更改前端代码重复注册，在后台也加入校验机制
			
			
			List<Student> stucheck=studentService.findStudent(username);//返回查询结果集
			//判断是否被注册并返回相应信息
			if (!stucheck.isEmpty()) 
			{
//				out.print("<font color='red'>用户名已被注册！</font>");
				System.out.println("223用户名已经被注册!");
				return "registfail";
			} 
			else 
			{

				
				//结构化供注册的实体类
				System.out.println("username233:"+username);
				this.student.setUsername(username);
				this.student.setPassword(password);
				this.student.setName(name);
				this.student.setSex(sex);
				
				
				
				score.setStudent(student);
				score.setIsscored((long) 0);
				
				
				
				
				
				scoreService.saveScore(score);
				//因为是级联保存，所以保存score的时候会自动保存student
//				studentService.saveStudent(student);
				
				System.out.println("注册成功");
				
				
				
				session.setAttribute("score", score);
				session.setAttribute("student", student);
				
				return "registsuccess";
				

			}
		}

}
