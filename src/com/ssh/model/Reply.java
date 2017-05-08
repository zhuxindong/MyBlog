package com.ssh.model;

import java.sql.Timestamp;

public class Reply {
	private Long id;
	private Student ustudent;
	private Student mstudent;
	private String content;
	private Message hmessage;
	private Timestamp createtime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Student getUstudent() {
		return ustudent;
	}
	public void setUstudent(Student ustudent) {
		this.ustudent = ustudent;
	}
	public Student getMstudent() {
		return mstudent;
	}
	public void setMstudent(Student mstudent) {
		this.mstudent = mstudent;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public Message getHmessage() {
		return hmessage;
	}
	public void setHmessage(Message hmessage) {
		this.hmessage = hmessage;
	}
	
	
}
