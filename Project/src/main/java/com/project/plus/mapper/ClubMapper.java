package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;

public interface ClubMapper {
	public void insertClub(ClubVO vo);
	public ClubVO getClubInfo(ClubVO vo);
	public List<String> getClubHashtag();
	public ClubVO getMyClubInfo(ClubVO vo);
	public int updateClub(ClubVO vo);
}
