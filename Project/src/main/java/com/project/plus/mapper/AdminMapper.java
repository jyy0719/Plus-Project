package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.InquiryVO;

public interface AdminMapper {
	public void deleteAdminInquiry(InquiryVO vo);
//	public void answerForm(InquiryVO vo);
	public void answerInquiry(InquiryVO vo);
	InquiryVO getAdminInquiry(InquiryVO vo);
	List<InquiryVO> getAdminInquiryList(InquiryVO vo);
}
