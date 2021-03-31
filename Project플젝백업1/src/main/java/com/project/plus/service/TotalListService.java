package com.project.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.mapper.TotalListMapper;

public interface TotalListService {
	
	/* 게시판 목록 */
	public List<ClubVO> getList();
	
	/* 게시판 목록(페이징 적용) */
	public List<ClubVO> getListPaging(Criteria cri);
	
	/* 게시판 총 갯수 */
	public int getTotal(Criteria cri);
}




