package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.InquiryVO;
import com.project.plus.mapper.InquiryMapper;
import com.project.plus.service.InquiryService;

@Service("InquiryService")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryMapper mapper;
	
	
	@Override
	public void writeInquiry(InquiryVO vo) {
		mapper.writeInquiry(vo);
	}
	
	@Override
	public void editInquiry(InquiryVO vo) {
		mapper.editInquiry(vo);
	}

	@Override
	public void deleteInquiry(InquiryVO vo) {
		mapper.deleteInquiry(vo);
	}

	@Override
	public InquiryVO getInquiry(InquiryVO vo) {
		return mapper.getInquiry(vo);
	}

	@Override
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return mapper.getInquiryList(vo);
	}
	
}
