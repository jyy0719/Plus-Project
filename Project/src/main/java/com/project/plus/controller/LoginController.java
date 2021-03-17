package com.project.plus.controller;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.impl.MemberServiceImpl;




public class LoginController {

    

	
    @RequestMapping(value = "/login.jsp", method = RequestMethod.GET)
    public String LoginPage(MemberVO vo) {
        return "login.jsp";
    }
	
	@RequestMapping(value="login.jsp", method=RequestMethod.POST) 
	public String login(MemberVO vo, HttpSession session) {
		MemberServiceImpl loginService = new MemberServiceImpl();
	
		try {
			MemberVO user = loginService.login(vo);
			session.setAttribute("user", user);
			
		} catch(Exception e) {
			e.printStackTrace();
			return "login.jsp";
		}
		return "index.jsp";
	}
}

	
	
//	@Autowired
//	MemberVO memberService;  //?
//	
//	@RequestMapping(value="/login.do", method=RequestMethod.POST)
//	public String login(MemberVO vo, HttpSession session) {
//		System.out.println("로그인 인증 처리...");
//		if(vo.getMemberEmail() == null || vo.getMemberEmail().equals("")) {
//			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다");
//		}
//		MemberVO user = memberService;  //?
//		if(user != null) { 
//			session.setAttribute("userName", user.getMemberNickname());
//			return "getBoardList.do";
//		}
//		else
//			return "login.jsp";
//	}
////}
