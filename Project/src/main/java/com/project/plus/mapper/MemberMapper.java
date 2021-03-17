package com.project.plus.mapper;

import com.project.plus.domain.MemberVO;

public interface MemberMapper {
	public void joinMember(MemberVO vo);
	
	public MemberVO login(MemberVO vo);
}
