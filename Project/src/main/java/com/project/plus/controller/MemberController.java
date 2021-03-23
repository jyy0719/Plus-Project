package com.project.plus.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.MemberService;

@Controller
@SessionAttributes("user")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
    private JavaMailSender mailSender;


	
	@RequestMapping(value="memberJoin.do", method=RequestMethod.POST)
	public String memberJoin(MemberVO vo) throws Exception {
		
		
//		MultipartFile uploadFile = vo.getUploadfile();
//		if(!uploadFile.isEmpty()) {
//			String fileName = uploadFile.getOriginalFilename();
//			uploadFile.transferTo(new File("C:/" + fileName));
//		}
		
		
		memberService.joinMember(vo);
		return "index";
			
	}
	
	@RequestMapping(value="memberJoin.do", method=RequestMethod.GET)
	public String memberUpdatepage(MemberVO vo, HttpSession session, Model model) throws Exception {
	return "memberJoin";
	}
	
	
	

	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session, Model model) throws Exception {
		
		
//		MultipartFile uploadFile = vo.getUploadfile();
//		if(!uploadFile.isEmpty()) {
//			String fileName = uploadFile.getOriginalFilename();
//			uploadFile.transferTo(new File("C:/" + fileName));
//		}
		System.out.println(vo);
		memberService.updateMember(vo);
		MemberVO member = memberService.selectMember(vo);
//		System.out.println("업데이트전 정보");
		model.addAttribute("user", member);
//		System.out.println(session.getAttribute("user"));
		session.removeAttribute("user");
//		System.out.println(session.getAttribute("user")+"");
//		System.out.println("업데이트 후 정보");
		session.setAttribute("user", member);
//		System.out.println(session.getAttribute("user"));
		
		return "redirect:/memberUpdate.jsp";

	}
	
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
	@RequestMapping(value="mailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
		System.out.println("메일함수 진입");
		
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888);
        logger.info("인증번호 " + checkNum);

        /* 이메일 보내기 */
        String setFrom = "plusprojectofficial@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		  try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }

		  String num = Integer.toString(checkNum);
		  System.out.println(num);
		  return num;
        
    }
 



	
	
}
