package com.project.plus.mapper;

import com.project.plus.domain.FaqVO;


public interface FaqMapper {
	public void insertFaq(FaqVO vo);
	public String selectNow();
}
