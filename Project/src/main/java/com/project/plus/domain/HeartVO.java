package com.project.plus.domain;

public class HeartVO {
	private int heartNum;
	private int memberNum;
	private int clubNum;
	private String clubName;
	
	/*추가한 vo*/
	private String clubThumbPic;

	
	
	public int getHeartNum() {
		return heartNum;
	}

	public void setHeartNum(int heartNum) {
		this.heartNum = heartNum;
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

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	/*추가한 vo의 getter-setter*/
	public String getClubThumbPic() {
		return clubThumbPic;
	}

	public void setClubThumbPic(String clubThumbPic) {
		this.clubThumbPic = clubThumbPic;
	}
	
	
}
