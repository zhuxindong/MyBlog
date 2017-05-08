package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ssh.dao.ScoreDAO;
import com.ssh.model.Score;
import com.ssh.model.Student;

@Component
public class ScoreService {
	
	
	@Autowired
	private ScoreDAO scoreDAO;
	
	
	//下面是各种服务方法
	
	//实现保存分数的功能
	public void saveScore(Score score)
	{
		this.scoreDAO.SaveScore(score);
	}
	
	
	//通过学生查找该学生的分数
	public List<Score> findScorebyStudent(Student student)
	{
		return this.scoreDAO.FindScoreByStudent(student);
	}
	
	
	//实现提交分数的功能
	public void updateScore(Score score)
	{
		this.scoreDAO.UpdateScore(score);
		
	}
	
	
	
	
}
