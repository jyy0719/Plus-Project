package com.project.plus.controller;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.MemberService;
import com.project.plus.service.impl.MemberServiceImpl;



@Controller
@SessionAttributes("user")
public class LoginController {

    @Autowired
	private MemberService memberService;

    //로그인 페이지 접속했을 때 연결
	@RequestMapping(value="login.do", method=RequestMethod.GET) 
	public String loginpage(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	
		return "login";

	}
	
	//로그인 버튼 클릭했을 때 실행되는 컨트롤러
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
			System.out.println(user + "일반로그인 유저정보 획득");
			return "index";
			
		} catch(Exception e) {
			e.printStackTrace();
			//로그인 실패했을 때
//			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다");
			System.out.println("로그인 실패");

			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
//	            out.println("<script>alert('로그인 정보를 확인해주세요.');location.href = '/login.jsp';</script>");

	            
	            out.println("<script>alert('기본 로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//	            out.flush();
	            out.close();


			return "login.do";
		}
	}
	
	
	/*
	
	//카카오로그인 컨트롤러
	@SuppressWarnings("finally")
	@RequestMapping(value="kakaologin.do", method=RequestMethod.POST) 
	public @ResponseBody String kakaologin(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	System.out.println("카카오 로그인 컨트롤러 접속");
	
			vo = memberService.kakaologin(vo);
			System.out.println(vo + "카카오 로그인시 vo 확인");  //카카오 로그인시 vo 확인
			
			try {	
				if(vo.getMemberEmail() == null) {  //카카오정보 등록안돼있을때 .. 인데 여기서 자꾸 널포인터익셉션 ㅠㅠ
					
				
					//session.setAttribute("user", null); //vo 말고  null로 해야하나
					System.out.println(vo+"카카오 db에 없을때");
					System.out.println("카카오 아이디로 로그인된 정보 없음");
						return "memberJoin";
				}else {
					session.setAttribute("user", vo);
					System.out.println(vo + "카카오 아이디 db에 이미 등록되어있음!");
					return "main";
				}
			
			}catch (NullPointerException e) {
				e.printStackTrace();
			}finally {
				return "memberJoin";
			}
	}
	
	
	*/
	
	
	
	
	/*
	
	@RequestMapping(value="kakaologin.do", method=RequestMethod.POST) 
	public @ResponseBody String kakaologin(MemberVO vo, HttpSession session, HttpServletResponse response) {
	System.out.println("카카오 로그인 컨트롤러 접속");
	
			vo = memberService.kakaologin(vo);
			System.out.println(vo);  //카카오 로그인 시도했을때 vo 들어오는지 확인
			
		try {
			
			if(vo.getMemberEmail() == "") {
				session.setAttribute("user", vo); //vo 말고  null로 해야하나
				System.out.println(vo+"카카오 db에 없을때");
				System.out.println("카카오 아이디로 로그인된 정보 없음");
				return "memberJoin";
			}else {
				session.setAttribute("user", vo);
				System.out.println(vo + "카카오 아이디 db에 이미 등록되어있음!");
				return "main";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			//로그인 실패했을 때
//			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다");
			System.out.println("카카오 로그인 실패");

			 response.setContentType("text/html; charset=UTF-8");
	     //       PrintWriter out = response.getWriter();
//	            out.println("<script>alert('로그인 정보를 확인해주세요.');location.href = '/login.jsp';</script>");

	            
	       //     out.println("<script>alert('카카오 로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//	            out.flush();
	        //    out.close();
	            return "memberJoin.do";
		}
		//return "main";
	}
	
	
	
	*/
	
	
	//카카오정보 vo에 담아서 헤더에 사람이름 출력가능!! 
	@RequestMapping(value="kakaologin.do", method=RequestMethod.POST) 
	public @ResponseBody String kakaologin(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	System.out.println("카카오 로그인 컨트롤러 접속");
		try {
			//로그인 성공했을 때
			vo = memberService.kakaologin(vo);
			
			MemberVO user = vo;
			System.out.println(vo + "vo카카오");  //카카오 로그인시 vo 확인
			System.out.println("user카카2"+user);
			
			if(user.getMemberNum()!=0) {
				session.setAttribute("user", user);
				System.out.println("해봐라user " + user);
				System.out.println("해봐라"+vo);
				return "main.do";
			}else if(user.getMemberNum()==0) {
				session.setAttribute("user", user);
				System.out.println("이상한디?user" + user);
				return "memberJoin.do";
			}
			
//			session.setAttribute("user", vo);
//			System.out.println("카카오" + vo);
//			
			return "main.do";
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("카카오 로그인 실패");
			return "login";
		}
	}
	
	
	
	
	@RequestMapping(value="naverlogin.do", method=RequestMethod.GET) 
	public String naverlogin(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	System.out.println("naver로그인 컨트롤러 접속");
	System.out.println(session+"1");

		try {
			
		System.out.println(session+"세션a2a");
			//로그인 성공했을 때
			MemberVO user = memberService.login(vo);
			session.setAttribute("user", user);
//			System.out.println(user.getMemberEmail());
//			System.out.println(user.getMemberPassword());
//			System.out.println(user.getMemberNum());
//			System.out.println(user.getMemberNum());
			System.out.println(user+" 세션에 넣은 유저");
			return "main";
			
		} catch(Exception e) {
			e.printStackTrace();
			//로그인 실패했을 때
			System.out.println("로그인 컨트롤러 네이버 로그인 실패");

			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();

	            System.out.println("naver로그인 실패");
	        	System.out.println(session+"a1123a");
	            out.println("<script>alert('네이버 로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//	            out.flush();
	            out.close();


			return "memberJoin";
		}
	}
	
	
	//로그아웃 컨트롤러(로그아웃은 jsp에서 실행)
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
	
