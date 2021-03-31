package com.project.plus.domain;

import java.sql.Date;

public class BoardVO {
	private int boardNum;
	private int clubNum;
	private int memberNum;
	private String boardTitle;
	private String boardContent;
	private String boardPic;
	private Date boardRegDate;
	/*추가한 vo, 커뮤니티에서 꺼낼 때 필요한 vo , 근데 이렇게 중복되게 꺼내는게 맞는지 쩝 ,,,*/
	private String memberPic;
	private String memberNickName;
	
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getClubNum() {
		return clubNum;
	}
	public void setClubNum(int clubNum) {
		this.clubNum = clubNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardPic() {
		return boardPic;
	}
	public void setBoardPic(String boardPic) {
		this.boardPic = boardPic;
	}
	public Date getBoardRegDate() {
		return boardRegDate;
	}
	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}
	
	/*추가한 vo의 getter-setter*/
	public String getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", clubNum=" + clubNum + ", memberNum=" + memberNum + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardPic=" + boardPic + ", boardRegDate="
				+ boardRegDate + ", memberPic=" + memberPic + ", memberNickName=" + memberNickName + "]";
	}
	
	
}
