package com.ssh.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssh.model.Score;
import com.ssh.model.Student;

@Component
public class ScoreDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession()
	{
		return this.sessionFactory.getCurrentSession();
	}
	
	
	
	//下面是DAO的方法
	//1.实现保存分数的功能，传入参数是一个Score对象
	public void SaveScore(Score score)
	{
		this.getSession().save(score);
		
	}
	
	
	//2.实现通过学生查询分数的功能，传入参数是一个Student对象，（其实只要student对象里的id）
	public List<Score> FindScoreByStudent(Student student)
	{
		String hql="from Score c where c.student.id=?";
		
		return this.getSession().createQuery(hql).setLong(0, student.getId()).list();
		
	}
	
	//3.实现打分功能,传入的参数为一个Score对象
	public void UpdateScore(Score score)
	{
		this.getSession().update(score);
	}
	

}
