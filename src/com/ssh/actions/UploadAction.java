package com.ssh.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	private File doc;
	private String docFileName;
	private String docContentType;
	private String username;
	
	public File getDoc() {
		return doc;
	}
	public void setDoc(File doc) {
		this.doc = doc;
	}
	public String getDocFileName() {
		return docFileName;
	}
	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}
	public String getDocContentType() {
		return docContentType;
	}
	public void setDocContentType(String docContentType) {
		this.docContentType = docContentType;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
	public String uploadpicture() throws IOException {
        System.out.println(doc);
        System.out.println(docFileName);
        System.out.println(docContentType);
        
        
        ServletContext servletContext=ServletActionContext.getServletContext();
        
        String dir=servletContext.getRealPath("/user_picture/"+username+".jpg");
        
        System.out.println(dir);
        
        FileOutputStream out=new FileOutputStream(dir);
        FileInputStream in=new FileInputStream(doc);
        
        byte buffer[]=new byte[1024];
        
        int count=0;
        while((count=in.read(buffer))!=-1)
        {
        	out.write(buffer, 0, count);
        }
        
        out.close();
        in.close();
        
        return "success";
    }
}

