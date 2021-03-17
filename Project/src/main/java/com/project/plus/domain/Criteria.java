package com.project.plus.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 페이징 처리 담당 클래스

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	
	//searchBy가 어떤거냐에 따라서 쿼리문이 달라져야한다.
	private String searchBy;
	private String category; 
	private String onoff;
	private String hashtag;
	private String keyword;
	
	public String getListSearch;
	
	private String orderBy;
	private Double clubLatitude;
	private Double clubLongitude;
	public String getHeaderSearch;
	
	
    //한 페이지에 20까지, clubNum 거꾸로.
	public Criteria() {
		this(1,20, "clubNum desc");		
	}

	public Criteria(int pageNum, int amount, String orderBy) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.orderBy = orderBy;  //최신순으로 정렬한다.
	}

	public void setAmount(int i) {
		// TODO Auto-generated method stub
		
	}




}
