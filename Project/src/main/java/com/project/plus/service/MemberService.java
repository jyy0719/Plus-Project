package com.project.plus.service;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;

public interface MemberService {

	//회원가입
	void joinMember(MemberVO vo);

	public MemberVO login(MemberVO vo);
	public MemberVO kakaologin(MemberVO vo);

	
	public void logout(HttpSession session);
		
	void updateMember(MemberVO vo);
	
	public MemberVO selectMember(MemberVO vo);

}
