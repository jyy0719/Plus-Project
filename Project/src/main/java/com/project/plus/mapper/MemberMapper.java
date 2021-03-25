package com.project.plus.mapper;

import javax.servlet.http.HttpSession;

import com.project.plus.domain.MemberVO;

public interface MemberMapper {
	public void joinMember(MemberVO vo);
	

	public void updateMember(MemberVO vo);
	
	public MemberVO login(MemberVO vo);
	public MemberVO kakaologin(MemberVO vo);

	public void logout(HttpSession session);
	
	public MemberVO selectMember(MemberVO vo);


}
