package com.project.plus.domain;

import java.sql.Date;

public class ClubVO {
	private int clubNum;
	private String clubThumb_pic;
	private String clubName;
	private String clubLeader;
	private String clubTown;
	private int clubKind;
	private String clubCategory;
	private String clubOnOff;
	private int clubMax;
	private String clubFreq;
	private String clubContent1;
	private String clubContent1_pic;
	private String clubContent2;
	private String clubContent2_pic;
	private Date clubStartDate;
	private Date clubEndDate;
	private Date clubMakeDate;
	private Date clubShutDate;
	private int clubFee;
	private String clubHashtag;
	

	private int clubCurnum;
	
	private int clubHeart;
	private String clubLatitude;
	private String clubLongitude;
	
	
	public int getClubNum() {
		return clubNum;
	}
	public void setClubNum(int clubNum) {
		this.clubNum = clubNum;
	}
	public String getClubThumb_pic() {
		return clubThumb_pic;
	}
	public void setClubThumb_Pic(String clubThumb_pic) {
		this.clubThumb_pic = clubThumb_pic;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getClubLeader() {
		return clubLeader;
	}
	public void setClubLeader(String clubLeader) {
		this.clubLeader = clubLeader;
	}
	public String getClubTown() {
		return clubTown;
	}
	public void setClubTown(String clubTown) {
		this.clubTown = clubTown;
	}
	public int getClubKind() {
		return clubKind;
	}
	public void setClubKind(int clubKind) {
		this.clubKind = clubKind;
	}
	public String getClubCategory() {
		return clubCategory;
	}
	public void setClubCategory(String clubCategory) {
		this.clubCategory = clubCategory;
	}
	public String getClubOnOff() {
		return clubOnOff;
	}
	public void setClubOnOff(String clubOnOff) {
		this.clubOnOff = clubOnOff;
	}
	public int getClubMax() {
		return clubMax;
	}
	public void setClubMax(int clubMax) {
		this.clubMax = clubMax;
	}
	public String getClubFreq() {
		return clubFreq;
	}
	public void setClubFreq(String clubFreq) {
		this.clubFreq = clubFreq;
	}
	public String getClubContent1() {
		return clubContent1;
	}
	public void setClubContent1(String clubContent1) {
		this.clubContent1 = clubContent1;
	}
	public String getClubContent1_pic() {
		return clubContent1_pic;
	}
	public void setClubContent1_Pic(String clubContent1_pic) {
		this.clubContent1_pic = clubContent1_pic;
	}
	public String getClubContent2() {
		return clubContent2;
	}
	public void setClubContent2(String clubContent2) {
		this.clubContent2 = clubContent2;
	}
	public String getClubContent2_pic() {
		return clubContent2_pic;
	}
	public void setClubContent2_Pic(String clubContent2_pic) {
		this.clubContent2_pic = clubContent2_pic;
	}
	public Date getClubStartDate() {
		return clubStartDate;
	}
	public void setClubStartDate(Date clubStartDate) {
		this.clubStartDate = clubStartDate;
	}
	public Date getClubEndDate() {
		return clubEndDate;
	}
	public void setClubEndDate(Date clubEndDate) {
		this.clubEndDate = clubEndDate;
	}
	public Date getClubMakeDate() {
		return clubMakeDate;
	}
	public void setClubMakeDate(Date clubMakeDate) {
		this.clubMakeDate = clubMakeDate;
	}
	public Date getClubShutDate() {
		return clubShutDate;
	}
	public void setClubShutDate(Date clubShutDate) {
		this.clubShutDate = clubShutDate;
	}
	public int getClubFee() {
		return clubFee;
	}
	public void setClubFee(int clubFee) {
		this.clubFee = clubFee;
	}
	public int getClubCurnum() {
		return clubCurnum;
	}
	public void setClubCurnum(int clubCurnum) {
		this.clubCurnum = clubCurnum;
	}
	public int getClubHeart() {
		return clubHeart;
	}
	public void setClubHeart(int clubHeart) {
		this.clubHeart = clubHeart;
	}
	public String getClubLatitude() {
		return clubLatitude;
	}
	public void setClubLatitude(String clubLatitude) {
		this.clubLatitude = clubLatitude;
	}
	public String getClubLongitude() {
		return clubLongitude;
	}
	public void setClubLongitude(String clubLongitude) {
		this.clubLongitude = clubLongitude;
	}
	
	public String getClubHashtag() {
		return clubHashtag;
	}
	public void setClubHashtag(String clubHashtag) {
		this.clubHashtag = clubHashtag;
	}

	
	@Override
	public String toString() {
		return "ClubVO [clubNum=" + clubNum + ", clubThumb_Pic=" + clubThumb_pic + ", clubName=" + clubName
				+ ", clubLeader=" + clubLeader + ", clubTown=" + clubTown + ", clubKind=" + clubKind + ", clubCategory="
				+ clubCategory + ", clubOnOff=" + clubOnOff + ", clubMax=" + clubMax + ", clubFreq=" + clubFreq
				+ ", clubContent1=" + clubContent1 + ", clubContent1_Pic=" + clubContent1_pic + ", clubContent2="
				+ clubContent2 + ", clubContent2_Pic=" + clubContent2_pic + ", clubStartDate=" + clubStartDate
				+ ", clubEndDate=" + clubEndDate + ", clubMakeDate=" + clubMakeDate + ", clubShutDate=" + clubShutDate
				+ ", clubFee=" + clubFee + ", curNum=" + clubCurnum + ", clubHeart=" + clubHeart + ", clubLatitude="
				+ clubLatitude + ", clubLongitude=" + clubLongitude + "]";
	}
	
	
	
}
