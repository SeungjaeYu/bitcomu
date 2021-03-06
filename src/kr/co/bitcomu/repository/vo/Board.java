package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Board {
	private int userNo;
	private int postNo;
	private String userId;
	private String userName;
	private String postTitle;
	private String postContent;
	private Date regDt;
	private int codeValue;
	private String subject;
	private String codeName;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int userNo, int postNo, String userId, String userName, String postTitle, String postContent,
			Date regDt, int codeValue, String subject, String codeName) {
		super();
		this.userNo = userNo;
		this.postNo = postNo;
		this.userId = userId;
		this.userName = userName;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.regDt = regDt;
		this.codeValue = codeValue;
		this.subject = subject;
		this.codeName = codeName;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public int getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(int codeValue) {
		this.codeValue = codeValue;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	@Override
	public String toString() {
		return "Board [userNo=" + userNo + ", postNo=" + postNo + ", userId=" + userId + ", userName=" + userName
				+ ", postTitle=" + postTitle + ", postContent=" + postContent + ", regDt=" + regDt + ", codeValue="
				+ codeValue + ", subject=" + subject + ", codeName=" + codeName + "]";
	}
	
	

		
	
}
