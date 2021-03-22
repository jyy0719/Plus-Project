package com.project.plus.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 페이징 처리 담당 클래스

@Getter
@Setter
@ToString
public class Criteria {

	// searchBy가 어떤거냐에 따라서 쿼리문이 달라져야한다.
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

	private int page; // 보여줄 페이지 번호
	private int perPageNum; // 페이지당 보여줄 게시글의 개수

	// 한 페이지에 20까지, clubNum 거꾸로.
	public Criteria() {

		// 최초 게시판에 진입할 때를 위해서 기본 값을 설정 해야 한다.
		this.page = 1;
		this.perPageNum = 20;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 20;
			return;
		}

		this.perPageNum = perPageNum;
	}

	/* limit 구문에서 시작 위치를 지정할 때 사용된다. */
	/* this.page 1을 가져오려면 0이 되어야 해서 -1을 한다 */

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
