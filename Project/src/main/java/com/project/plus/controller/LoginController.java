package com.project.plus.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.MemberService;
import com.project.plus.service.impl.MemberServiceImpl;



@Controller
@SessionAttributes("user")
public class LoginController {

    

	
    @RequestMapping(value = "/login.jsp", method = RequestMethod.GET)
    public String LoginPage(MemberVO vo) {
        return "login.jsp";
    }
    
	
//	@RequestMapping(value="login.do", method=RequestMethod.POST) 
//	public String login(MemberVO vo, HttpSession session) {
//		MemberServiceImpl loginService = new MemberServiceImpl();
//	
//		try {
//			MemberVO user = loginService.login(vo);
//			session.setAttribute("user", user);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//			return "login.do";
//		}
//		return "index";
//	}
	
	
	@Autowired
	private MemberService memberService;
	
	@PostMapping("/login.do")
	public String login(MemberVO vo, Model model) {
		System.out.println("로그인 처리");
		model.addAttribute("user", memberService.login(vo));
		System.out.println(model);
		return "index";
	}
	
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		MemberServiceImpl memberServiceImpl = new MemberServiceImpl();
		memberServiceImpl.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
		
	}
}

	
	
