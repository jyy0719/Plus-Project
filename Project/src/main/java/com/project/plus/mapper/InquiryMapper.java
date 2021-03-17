package com.project.plus.mapper;


import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.InquiryVO;

public interface InquiryMapper{
	
	public String inquiryNow();
	
	public void insertInquiry(InquiryVO vo);

	public void updateInquiry(InquiryVO vo);

	public void deleteInquiry(InquiryVO vo);

	public String getInquiry(InquiryVO vo, Model model);

	public List<InquiryVO> getInquiryList(InquiryVO vo, Model model);

}
