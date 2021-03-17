package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;

public interface ClubService {
	public void insertClub(ClubVO vo);
	public ClubVO getClubInfo(ClubVO vo);
	public List<String> getClubHashtag();
	public ClubVO getMyClubInfo(ClubVO vo);
	public int updateClub(ClubVO vo);
}
