package com.farmingtool.dto;

import java.util.Date;

public class MemberEducation {
	private int educationNo;
	private String fmNo;
	private String memberId;
	private String educationName;
	private Date educationDate;
	private Date educationExpireDate;
	public int getEducationNo() {
		return educationNo;
	}
	public void setEducationNo(int educationNo) {
		this.educationNo = educationNo;
	}
	public String getFmNo() {
		return fmNo;
	}
	public void setFmNo(String fmNo) {
		this.fmNo = fmNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getEducationName() {
		return educationName;
	}
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}
	public Date getEducationDate() {
		return educationDate;
	}
	public void setEducationDate(Date educationDate) {
		this.educationDate = educationDate;
	}
	public Date getEducationExpireDate() {
		return educationExpireDate;
	}
	public void setEducationExpireDate(Date educationExpireDate) {
		this.educationExpireDate = educationExpireDate;
	}
	
	
}
