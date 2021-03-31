package com.project.plus.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.plus.domain.AnnounceVO;

public interface AnnounceService {
	
	void insertAnnounce(AnnounceVO vo);
	void updateAnnounce(AnnounceVO vo);
	void deleteAnnounce(AnnounceVO vo);
	AnnounceVO getAnnounce(AnnounceVO vo);
	List<AnnounceVO> getAnnounceList(AnnounceVO vo);
}
