package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ChatRoomVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.mapper.ClubMapper;
import com.project.plus.service.ClubService;

@Service("ClubService")
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	ClubMapper mapper;
	
	public void insertClub(ClubVO vo) {
		mapper.insertClub(vo);
	}
	public ClubVO getClub(ClubVO vo) {
		return mapper.getClub(vo);
		
	}
	public List<String> getClubHashtag() {
		return mapper.getClubHashtag();
	}
	public ClubVO getMyClubInfo(ClubVO vo) {
		return mapper.getMyClubInfo(vo);
	}
	public int updateClub(ClubVO vo) {
		return mapper.updateClub(vo);
	}
	public void deleteClub(ClubVO vo) {
		mapper.deleteClub(vo);
	}
	
	public int apply(ApplyVO apply) {
		return mapper.apply(apply);
	}
	public Integer getOneApply(ApplyVO apply) {
		return mapper.getOneApply(apply);
	}
	public List<ClubVO> getChatList(int memNum) {
		return mapper.getChatList(memNum);
	}
	@Override
	public ChatRoomVO getMessages(int clubNum) {
		return mapper.getMessages(clubNum);
	}
	public int insertMessage(ChatRoomVO msg) {
		return mapper.insertMessage(msg);
	}
	
	//정연 하단 추가 20210326
	// 추가 - 정연 (리뷰에서 쓸 것)
	public ClubVO selectClub(ClubVO vo) {
		return mapper.selectClub(vo);
	}
}
