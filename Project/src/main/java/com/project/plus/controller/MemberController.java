package com.project.plus.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.MemberService;
import com.project.plus.utils.ProfileUtils;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@SessionAttributes("user")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
    private JavaMailSender mailSender;

	@RequestMapping(value="memberList.do", method=RequestMethod.POST)
	public String memberList(Model model) {
		List<MemberVO> list = memberService.memberList();
		model.addAttribute("list", list);
		return "memberList.member";
	}
	

	@RequestMapping(value="memberJoin.do", method=RequestMethod.GET)
	public String memberjoinpage(MemberVO vo, HttpSession session, Model model) throws Exception {
		System.out.println("회원가입 get메서드 진입");
	return "memberJoin";
	}
	
	@RequestMapping(value="memberJoin.do", method=RequestMethod.POST)
	public String memberJoin(MemberVO vo, @RequestParam("memberPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
		System.out.println("회원가입 컨트롤러 진입");
		// 파일을 저장할 절대 경로 지정
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		vo = ProfileUtils.profile(vo, uploadPath, file);
		memberService.joinMember(vo);
		System.out.println(vo);
		log.info("회원 번호 : " + vo.getMemberNum() + "멤버프로필사진  등록 ");
		return "main/index"; //?
			
	}
	
	
	//휴대폰번호 중복검사 메서드
	@RequestMapping(value = "memberPhoneCheck", method = RequestMethod.POST)
	@ResponseBody public String memberPChk(String memberPhone) throws Exception{ 
		int result = memberService.memberPChk(memberPhone); 
		logger.info("결과값 = " + result); 
		if(result != 0) { 
			return "fail"; // 중복 폰번호 존재
			} else { 
				return "success"; // 중복 폰번호 x 
			}
	}

		 
	//닉네임 중복검사 메서드
	@RequestMapping(value = "memberNickCheck", method = RequestMethod.POST)
	@ResponseBody public String memberNickChk(String memberNickname) throws Exception{ 
		int result = memberService.memberNChk(memberNickname); 
		logger.info("결과값 = " + result); 
		if(result != 0) { 
			return "fail"; // 중복 닉네임이 존재 
			} else { 
				return "success"; // 중복 닉네임 x 
			}
	}
	
	
	
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.GET)
	public String memberUpdatepage(MemberVO vo, HttpSession session, Model model) throws Exception {
	return "memberUpdate.member";
	}
	
	
	

	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session, Model model, HttpServletResponse response, @RequestParam("memberPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
		
		
		System.out.println("기본"+vo);  //0 email에 36이담겨 ;;  //수정후 정보
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		vo = ProfileUtils.profile(vo, uploadPath, file);
		memberService.updateMember(vo);
		MemberVO user = memberService.selectMember(vo);  
		System.out.println(session.getAttribute("user")); //36   //수정전 정보 

		System.out.println("선택정보 vo user에 담음");
		System.out.println(user); //null  //수정후 
		

//		if (user.getMemberPic() != null) {
//			String formatName = user.getMemberPic().substring(vo.getMemberPic().lastIndexOf("_") + 1);
//			user.setMemberPic(formatName);
//		}
//		
		
		
		
		//알럿창 띄우는 부분
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('정보 수정이 완료되었습니다.');</script>");
        out.flush();
		// 카카오 로그인 유저도 정보 수정은 되는데, 꼭 로그아웃 했다가 다시 로그인해야지만 수정된 정보가 반영됨. 이거 모델로 해결할 수 있을것 같은데 ..
		// 는 세션 리무브시키고 모델에 세션 담고 (??이게 가능한가??) 그다음에 세션에 setAtt user 해줬어 .. 그러니깐 수정되고 화면출력도됨
		
		session.removeAttribute("user");
		System.out.println(session.getAttribute("user")+""); //주석이었다    //null
		System.out.println("세션리무브확인");
		
		model.addAttribute("user", session.getAttribute("user")); //정보 담았어 
		System.out.println(session.getAttribute("user")); //여기에만 정보가 담겨있어   //null인데 ?? 
		System.out.println(model.containsAttribute("user")); //   //ture가 나와..?
		System.out.println("모델에 뭐들었지"+model);
		System.out.println(user+"모델에put한유저"+vo); //user=null , vo=0    //수정후정보 
		
		System.out.println("업데이트 후 정보");
		session.setAttribute("user", user);
		System.out.println(session.getAttribute("user"));  //주석이었다    //수정후정보

		
		
		return "memberUpdate.member";

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
