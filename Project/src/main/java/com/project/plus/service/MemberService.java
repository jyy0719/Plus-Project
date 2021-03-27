package com.project.plus.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;

public interface MemberService {

	//회원가입
	void joinMember(MemberVO vo);

	public MemberVO login(MemberVO vo);
	public MemberVO kakaologin(MemberVO vo);

	// 휴대폰번호 중복 검사
	public int memberPChk(String memberPhone);
	// 닉네임 중복 검사
	public int memberNChk(String memberNickname);
	
	
	public void logout(HttpSession session);
		
	void updateMember(MemberVO vo);
	
	public MemberVO selectMember(MemberVO vo);

	List<MemberVO> memberList();

	   void updateMemberPoint (MemberVO vo);
	   int selectMemberPoint (MemberVO vo);
	   int selectMemberPointByNickname(MemberVO vo);
	//   int selectMemberPoint(PaymentVO vo);
	   void deductMemberPoint(MemberVO vo);
	   void updateClubLeaderPoint(MemberVO vo);

}
