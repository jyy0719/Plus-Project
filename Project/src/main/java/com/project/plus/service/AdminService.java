package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.InquiryVO;

public interface AdminService {
	
	void deleteAdminInquiry(InquiryVO vo);

	InquiryVO getAdminInquiry(InquiryVO vo);

	List<InquiryVO> getAdminInquiryList(InquiryVO vo);
	
//	void answerForm(InquiryVO vo);
	
	void answerInquiry(InquiryVO vo);
	
}
