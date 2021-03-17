package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;

public interface MainMapper {
	   //더하기 만들기
		public void insertClub(ClubVO vo);
		//인기 더하기 리스트
		public List<ClubVO> getListBest();
		//마감임박 더하기 리스트
		public List<ClubVO> getListDeadline();
		//전체보기
		public ClubVO getPlusListInfo(ClubVO vo);
		//모임 검색
		public List<ClubVO> getListSearch(String keyword);


}
