package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssh.dao.StudentDAO;
import com.ssh.model.Student;

@Component
public class StudentService {

	@Autowired
	private StudentDAO studentDAO;
	
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	public StudentDAO getStudentDAO() {
		return studentDAO;
	}
	
	
	//下面写service服务方法
	
	//1.根据用户名查询学生，返回值是Student对象的一个list,参数为username
	public List<Student> findStudent(String username)
	{
		System.out.println("用户名fuck:"+username);
		System.out.println("studentDAO:"+studentDAO);
		return this.studentDAO.FindStudentByUsername(username);
	}
	
	
	//2.保存一个学生用户，传入参数为一个student对象
	public void saveStudent(Student student)
	{
		this.studentDAO.SaveStudent(student);
	}
	
	//3.更新学生信息，传入参数为student对象
	public void updateStudent(Student student)
	{
		this.studentDAO.UpdateStudent(student);
	}
	
	//4.查询未打分的学生，返回值为List<Oblect[]>
	public List<Object []> findnotscoredStudent()
	{
		return this.studentDAO.FindNotscoredStudent();
	}
	
	//5.查询已打分的学生，返回值为List<Oblect[]>
	public List<Object []> findhadscoredStudent()
	{
		return this.studentDAO.FindHadscoredStudent();
	}
	
	//6.查询已打分学生的总数
	public int stu_Scored()
	{
		return this.studentDAO.Stu_Scored();
	}
	
	
	//7.查询平均分，传入的参数为职务的缩写,如班长:bz
	public double[] averageScore(String position)
	{
		return this.studentDAO.AverageScore(position);
	}
	
}
