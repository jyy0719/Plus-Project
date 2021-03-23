package com.project.plus.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.MemberService;
import com.project.plus.service.impl.MemberServiceImpl;

import lombok.extern.log4j.Log4j;



@Controller
@SessionAttributes("user")
@Log4j
public class LoginController {

    @Autowired
	private MemberService memberService;

    
	@RequestMapping(value="login.do", method=RequestMethod.GET) 
	public String loginpage(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	
		return "login";

	}
	
    @GetMapping("/loginPage.do")
	public void login() {
		log.info("/로그인 화면 접속");
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST) 
	public String login(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	System.out.println("로그인 컨트롤러 접속");
		try {
			//로그인 성공했을 때
			MemberVO user = memberService.login(vo);
			session.setAttribute("user", user);
			System.out.println(user.getMemberEmail());
			System.out.println(user.getMemberPassword());
			System.out.println(user.getMemberNum());
			System.out.println(user.getMemberNum());
			System.out.println(user);
			return "login";
			
		} catch(Exception e) {
			e.printStackTrace();
			//로그인 실패했을 때
//			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다");
			System.out.println("로그인 실패");

			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
//	            out.println("<script>alert('로그인 정보를 확인해주세요.');location.href = '/login.jsp';</script>");

	            
	            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//	            out.flush();
	            out.close();


			return "redirect:/login.jsp";
		}
	}
	
	
	@RequestMapping("logout.do")
	public void logout(HttpSession session) {
		MemberServiceImpl memberServiceImpl = new MemberServiceImpl();
		memberServiceImpl.logout(session);
		/*
		 * session.invalidate(); return "redirect:/login.jsp";
		 */
	}


	
//	@Autowired
//	private MemberService memberService;
//	
//	@PostMapping("/login.do")
//	public String login(MemberVO vo, Model model) {
//		System.out.println("로그인 처리");
//		model.addAttribute("user", memberService.login(vo));
//		System.out.println(model);
//		return "index";
//	}
//	
	
//	@RequestMapping("logout.do")
//	public ModelAndView logout(HttpSession session) {
//		MemberServiceImpl memberServiceImpl = new MemberServiceImpl();
//		memberServiceImpl.logout(session);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("login");
//		mav.addObject("msg", "logout");
//		return mav;
//	}
	
	
	


	

	
}
	
