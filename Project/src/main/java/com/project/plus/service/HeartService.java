package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.HeartVO;

public interface HeartService {
	
	List<HeartVO> selectFreeClub(HeartVO vo); 
	List<HeartVO> selectNoFreeClub(HeartVO vo);
	void deleteHeart(HeartVO vo);
	void insertHeart(HeartVO vo);
	int selectHeartNum(HeartVO vo);
//	void applyFreeClub(ApplyVO vo);
//	ApplyVO checkApplyClub(ApplyVO vo);
	
}
