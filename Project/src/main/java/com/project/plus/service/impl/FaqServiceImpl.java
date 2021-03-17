package com.project.plus.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.plus.domain.FaqVO;
import com.project.plus.mapper.FaqMapper;
import com.project.plus.service.FaqService;

@Service("FaqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqMapper mapper;
	
	
	public void insertFaq(FaqVO vo) {
		mapper.insertFaq(vo);
	}
	public String selectNow() {
		return mapper.selectNow();
		
	}
}
