package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="notes")
public class Note {
	@Id
	private	int id; 
	private String Title;
	@Column(length=10000)
	private String content;
	private Date addeddate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAddeddate() {
		return addeddate;
	}
	public void setAddeddate(Date addeddate) {
		this.addeddate = addeddate;
	}
	public Note(String title, String content, Date addeddate) {
		super();
		this.id = new Random().nextInt(1000000);
		Title = title;
		this.content = content;
		this.addeddate = addeddate;
	}
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
