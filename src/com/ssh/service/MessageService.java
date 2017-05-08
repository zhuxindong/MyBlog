package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssh.dao.MessageDAO;
import com.ssh.model.Message;
import com.ssh.model.Student;

@Component
public class MessageService {
	
	@Autowired
	private MessageDAO messageDAO;

	public MessageDAO getMessageDAO() {
		return messageDAO;
	}

	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	
	//下面是service的服务方法
	//1.持久化一条动态（message）
	public void saveMessage(Message message)
	{
		this.messageDAO.SaveMessage(message);
	}
	
	
	//2.查询所有的动态
	public List<Message> findallMessage()
	{
		return this.messageDAO.FindAllMessage();
	}
	
	//3.查询某一位用户的所有动态
	public List<Message> findMessagebystudent(Student student)
	{
		return this.messageDAO.FindMessageByStudent(student);
	}
	
	
	//4.根据id来查找一条message
	public Message findMessagebyid(Long id)
	{
		return this.messageDAO.FindMessageById(id);
	}
	
	
	//5.删除一条message
	public void deleteMessage(Message message)
	{
		this.messageDAO.DeleteMessage(message);
	}
	
	
	
	
	
}
