package com.ssh.test;

import static org.junit.Assert.*;

import javax.transaction.Transactional;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.Result;
import com.ssh.dao.StudentDAO;

public class TestDAO {
	
	ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext*.xml");
	
	
	@Test
	public void test() {
		StudentDAO studentDAO=ctx.getBean(StudentDAO.class);
		for (int i = 0; i < 5; i++) {
			System.out.println(studentDAO.AverageScore("tzs")[i]);
		}
		
	}

}
