package com.project.plus.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ApplyVO;
import com.project.plus.mapper.ApplyMapper;
import com.project.plus.service.ApplyService;

@Service
public class ApplyServiceImpl implements ApplyService {

	@Autowired
	ApplyMapper mapper;
	
	@Override
	public int apply(ApplyVO vo) {
		return mapper.apply(vo);
	}

	@Override
	public Integer getOneApply(ApplyVO vo) {
		return mapper.getOneApply(vo);
	}


}
