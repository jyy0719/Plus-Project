package com.project.plus.mapper;

import javax.servlet.http.HttpSession;

import com.project.plus.domain.MemberVO;

public interface MemberMapper {
	public void joinMember(MemberVO vo);
	

	public void updateMember(MemberVO vo);
	
	public MemberVO login(MemberVO vo);
	public MemberVO kakaologin(MemberVO vo);

	//휴대폰번호 중복 검사
	public int memberPChk(String memberPhone);
	//닉네임 중복 검사
	public int memberNChk(String memberNickname);

	public void logout(HttpSession session);
	
	public MemberVO selectMember(MemberVO vo);




}
