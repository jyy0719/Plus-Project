package com.project.plus.service;

import com.project.plus.domain.ApplyVO;


public interface ApplyService {
	public int apply(ApplyVO vo);
	public Integer getOneApply(ApplyVO vo);
}
