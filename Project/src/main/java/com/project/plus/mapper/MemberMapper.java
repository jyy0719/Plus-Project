package com.project.plus.mapper;

import javax.servlet.http.HttpSession;

import com.project.plus.domain.MemberVO;

public interface MemberMapper {
	public void joinMember(MemberVO vo);
	public void updateMember(MemberVO vo);
	
	public MemberVO login(MemberVO vo);
	public Integer kakaologin(MemberVO vo);

	//휴대폰번호 중복 검사
	public int memberPChk(String memberPhone);
	//닉네임 중복 검사
	public int memberNChk(String memberNickname);

	public void logout(HttpSession session);
	
	public MemberVO selectMember(MemberVO vo);
	
	//정연 하단 추가 20210326

	public void updateMemberPoint (MemberVO vo);
	
	public int selectMemberPointByNickname(MemberVO vo);

	public int selectMemberPoint(MemberVO vo);
	
	public void deductMemberPoint(MemberVO vo);
	
	public void updateClubLeaderPoint(MemberVO vo);



}
