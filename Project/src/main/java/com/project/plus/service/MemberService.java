package com.project.plus.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.project.plus.domain.MemberVO;

public interface MemberService {

	//회원가입
	void joinMember(MemberVO vo);

	public MemberVO login(MemberVO vo);
	
	public void logout(HttpSession session);
		
	void updateMember(MemberVO vo);
}
