package com.project.plus.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.InquiryVO;

public interface InquiryService {
	
	// 글 등록
	void insertInquiry(InquiryVO vo);
	
	// 글 수정
	void updateInquiry(InquiryVO vo);
	
	// 글 삭제
	void deleteInquiry(InquiryVO vo);
	
	// 글 상세 조회
	String getInquiry(InquiryVO vo, Model model);
	
	// 글 목록 조회
	List<InquiryVO> getInquiryList(InquiryVO vo, Model model);
	
}