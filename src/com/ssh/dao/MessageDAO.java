package com.ssh.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssh.model.Message;
import com.ssh.model.Student;

@Component
public class MessageDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession()
	{
		return this.sessionFactory.getCurrentSession();
	}
	
	//下面是dao方法
	//1.持久化一条动态（message）
	public void SaveMessage(Message message)
	{
		this.getSession().save(message);
		
	}
	
	//2.列出所有动态
	public List<Message> FindAllMessage()
	{
		String hql="from Message";
		return this.getSession().createQuery(hql).list();
	}
	
	//3.根据用户查找与用户有关的动态（列出某一位用户的动态)
	public List<Message> FindMessageByStudent(Student student)
	{
		String hql="from Message c where c.student.id=?";
		return this.getSession().createQuery(hql).setLong(0, student.getId()).list();
				
	}
	
	//4.根据id来获取一条message
	public Message FindMessageById(Long id)
	{
		return this.getSession().get(Message.class, id);
	
	}
	
	//5.删除一条message
	public void DeleteMessage(Message message)
	{
		this.getSession().delete(message);
	}
	
	
	
	
}
