package com.project.plus.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.plus.domain.MemberVO;
import com.project.plus.mapper.MemberMapper;
import com.project.plus.service.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper;
	
	@Autowired
	HttpSession session;

	public void joinMember(MemberVO vo) {
		System.out.println("회원가입 service impl");
		membermapper.joinMember(vo);
	}

	public MemberVO login(MemberVO vo) {
			System.out.println("member Service impl login메서드");
		return membermapper.login(vo);
	}

	public MemberVO kakaologin(MemberVO vo) {
		System.out.println("카카오로그인 servie impl옴");		
		return membermapper.kakaologin(vo);
	}


	@Override
	public void updateMember(MemberVO vo) {
		membermapper.updateMember(vo);
//		session.update("member.updateMember", vo);
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}

	
	public MemberVO selectMember(MemberVO vo) {
		return membermapper.selectMember(vo);
		
	}




	
	
	
	

}
