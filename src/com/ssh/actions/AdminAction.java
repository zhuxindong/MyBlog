package com.ssh.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Score;
import com.ssh.model.Student;
import com.ssh.service.ScoreService;
import com.ssh.service.StudentService;

public class AdminAction extends ActionSupport implements ServletRequestAware
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
	private String adminusername;
	private String adminpassword;
	private List<Object[]> notsubmitstu;
	private List<Object[]> hadsubmitstu;
	private double[] bz_ave;
	private double[] tzs_ave;
	private double[] dxwy_ave;
	private double[] xxwy_ave;
	private double[] wtwy_ave;
	private double[] xlwy_ave;
	private double[] shwy_ave;
	private double[] zzwy_ave;
	private int stu_scored;
	
	public String getAdminusername() {
		return adminusername;
	}



	public void setAdminusername(String adminusername) {
		this.adminusername = adminusername;
	}



	public String getAdminpassword() {
		return adminpassword;
	}



	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}



	public List<Object[]> getNotsubmitstu() {
		return notsubmitstu;
	}



	public void setNotsubmitstu(List<Object[]> notsubmitstu) {
		this.notsubmitstu = notsubmitstu;
	}



	public List<Object[]> getHadsubmitstu() {
		return hadsubmitstu;
	}



	public void setHadsubmitstu(List<Object[]> hadsubmitstu) {
		this.hadsubmitstu = hadsubmitstu;
	}

	
	

	public double[] getBz_ave() {
		return bz_ave;
	}



	public void setBz_ave(double[] bz_ave) {
		this.bz_ave = bz_ave;
	}



	public double[] getTzs_ave() {
		return tzs_ave;
	}



	public void setTzs_ave(double[] tzs_ave) {
		this.tzs_ave = tzs_ave;
	}

	
	
	
	
	
	
	
	

	public double[] getDxwy_ave() {
		return dxwy_ave;
	}



	public void setDxwy_ave(double[] dxwy_ave) {
		this.dxwy_ave = dxwy_ave;
	}



	public double[] getXxwy_ave() {
		return xxwy_ave;
	}



	public void setXxwy_ave(double[] xxwy_ave) {
		this.xxwy_ave = xxwy_ave;
	}



	public double[] getWtwy_ave() {
		return wtwy_ave;
	}



	public void setWtwy_ave(double[] wtwy_ave) {
		this.wtwy_ave = wtwy_ave;
	}



	public double[] getXlwy_ave() {
		return xlwy_ave;
	}



	public void setXlwy_ave(double[] xlwy_ave) {
		this.xlwy_ave = xlwy_ave;
	}



	public double[] getShwy_ave() {
		return shwy_ave;
	}



	public void setShwy_ave(double[] shwy_ave) {
		this.shwy_ave = shwy_ave;
	}



	public double[] getZzwy_ave() {
		return zzwy_ave;
	}



	public void setZzwy_ave(double[] zzwy_ave) {
		this.zzwy_ave = zzwy_ave;
	}

	
	


	public int getStu_scored() {
		return stu_scored;
	}



	public void setStu_scored(int stu_scored) {
		this.stu_scored = stu_scored;
	}
	
	
	public String execute()
	{
//		Student stu1=new Student((long) 1, "jinhe ", "123456", "hhe", "nan");
//		Student stu2=new Student((long) 1, "menglong ", "123456", "dapeng", "nan");
//		
//		notsubmitstu=new ArrayList();
//		
//		notsubmitstu.add(stu1);
//		notsubmitstu.add(stu2);
		
		if (adminusername.equals("admin")&&adminpassword.equals("admin")) {
			
			//查询已经打分和未打分的用户
			notsubmitstu=studentService.findnotscoredStudent();
			hadsubmitstu=studentService.findhadscoredStudent();
			
			
			//查询平均分
			bz_ave=studentService.averageScore("bz");
			tzs_ave=studentService.averageScore("tzs");
			dxwy_ave=studentService.averageScore("dxwy");
			xxwy_ave=studentService.averageScore("xxwy");
			wtwy_ave=studentService.averageScore("wtwy");
			xlwy_ave=studentService.averageScore("xlwy");
			shwy_ave=studentService.averageScore("shwy");
			zzwy_ave=studentService.averageScore("zzwy");
			stu_scored=studentService.stu_Scored();
			
			
			
			System.out.println("success");
			return "success";
		}
		
		else
		{
			addFieldError( "adminusername", "用户名或密码错误" );
			return "fail";
		}
		
		
		
	}
	
	
	
	//查看具体某一个学生的打分情况
	public String showScore()
	{
		String username=request.getParameter("username");
		
		student=studentService.findStudent(username).get(0);
		score=student.getScore();
		
		request.setAttribute("student", student);
		request.setAttribute("score", score);
		
		return "success";
	}
	
	
	
	

}
