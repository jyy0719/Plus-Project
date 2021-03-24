package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.domain.ReviewVO;

public interface ClubService {
	public void insertClub(ClubVO vo);
	public ClubVO getClub(ClubVO vo);
	public List<String> getClubHashtag();
	public ClubVO getMyClubInfo(ClubVO vo);
	public int updateClub(ClubVO vo);
	public void deleteClub(ClubVO vo);
	public int apply(ApplyVO apply);
	public Integer getOneApply(ApplyVO apply);
}
