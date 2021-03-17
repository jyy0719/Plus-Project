package com.project.plus.service.impl;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

		membermapper.joinMember(vo);

		
	}

	


	public MemberVO login(MemberVO vo) {
		return membermapper.login(vo);

	}

}
