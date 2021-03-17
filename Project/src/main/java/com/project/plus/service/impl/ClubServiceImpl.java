package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ClubVO getClubInfo(ClubVO vo) {
		return mapper.getClubInfo(vo);
		
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
}
