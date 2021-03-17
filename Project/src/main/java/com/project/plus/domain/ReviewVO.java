package com.project.plus.domain;

//import java.sql.Date;//sql date말고 자바로 했는뒈
import java.util.Date;

public class ReviewVO {
	private int reviewNum;
	private int memberNum;
	private int clubNum;
	private String reviewContent;
	private String reviewPic;
	private int reviewRate;
	private Date reviewRegDate;
	
	/*필요한 VO*/
	private String clubThumbPic;
	private String clubName;
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getClubNum() {
		return clubNum;
	}
	public void setClubNum(int clubNum) {
		this.clubNum = clubNum;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewPic() {
		return reviewPic;
	}
	public void setReviewPic(String reviewPic) {
		this.reviewPic = reviewPic;
	}
	public int getReviewRate() {
		return reviewRate;
	}
	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}
	public Date getReviewRegDate() {
		return reviewRegDate;
	}
	public void setReviewRegDate(Date reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}
	public String getClubThumbPic() {
		return clubThumbPic;
	}
	public void setClubThumbPic(String clubThumbPic) {
		this.clubThumbPic = clubThumbPic;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", memberNum=" + memberNum + ", clubNum=" + clubNum
				+ ", reviewContent=" + reviewContent + ", reviewPic=" + reviewPic + ", reviewRate=" + reviewRate
				+ ", reviewRegDate=" + reviewRegDate + ", clubThumbPic=" + clubThumbPic + ", clubName=" + clubName
				+ "]";
	}

	
}
