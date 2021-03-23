package com.project.plus.mapper;


import com.project.plus.domain.ApplyVO;

public interface ApplyMapper {
	public int apply(ApplyVO vo);
	public Integer getOneApply(ApplyVO vo);
}
