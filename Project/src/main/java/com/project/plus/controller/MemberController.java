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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PageMakerMem;
import com.project.plus.domain.SearchCriteriaMem;
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

	//회원 목록 조회
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public String memberList(Model model, SearchCriteriaMem scmem) {
		System.out.println("리스트 조회 하고싶다..");
		
		List<MemberVO> list = memberService.memberList(scmem);
		System.out.println(list);
		model.addAttribute("list", list);
		
		PageMakerMem pmem = new PageMakerMem();
		pmem.setCriMem(scmem);
		pmem.setTotalCount(memberService.listCount(scmem));
		model.addAttribute("pmem", pmem);
		return "memberList.member";
	}
	

	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public String memberjoinpage(MemberVO vo, HttpSession session, Model model) throws Exception {
		System.out.println("회원가입 get메서드 진입");
	return "memberJoin";
	}
	
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin(MemberVO vo, @RequestParam("memberPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
		System.out.println("회원가입 컨트롤러 진입");
		// 파일을 저장할 절대 경로 지정
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		vo = ProfileUtils.profile(vo, uploadPath, file);
		memberService.joinMember(vo);
		System.out.println(vo);
		log.info("회원 번호 : " + vo.getMemberNum() + "멤버프로필사진  등록 ");
		return "redirect:main"; //?
			
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
	
	
	//로그인하고 내정보확인 페이지 들어가면 정보 뿌려주는 메서드
	@RequestMapping(value="memberUpdate", method=RequestMethod.GET)
	public String memberUpdatepage(MemberVO vo, HttpSession session, Model model) throws Exception {
	System.out.println("memberUpdate get method");
	
	//MemberVO mInfo = memberService.selectMember(vo);  
    model.addAttribute("memberInfo", memberService.viewMember(vo.getMemberNum()));

	//model.addAttribute("memberInfo", vo);
	System.out.println(vo);
	MemberVO user = (MemberVO) session.getAttribute("user"); //로그인한 사람의 정보 (세션에서 가져옴)

	return "memberUpdate.member";
	}
	


	//회원 정보 업데이트하는 메서드 
	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session, Model model, HttpServletResponse response, @RequestParam("memberPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
		
		//MemberVO memberNum = vo; //밑에 return if문 쓰려고 만든 변수
		System.out.println("기본"+vo);  //0 email에 36이담겨 ;;  //수정후 정보   //수정후 정보 
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		vo = ProfileUtils.profile(vo, uploadPath, file);
		memberService.updateMember(vo);
		MemberVO mInfo = memberService.selectMember(vo);  
		System.out.println(session.getAttribute("user")); //36   //수정전 정보  //로그인한사람 정보

		System.out.println("선택정보 vo user에 담음");
		System.out.println(mInfo); //null  //수정후 
		

		
		//알럿창 띄우는 부분
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('정보 수정이 완료되었습니다.');</script>");
        out.flush();
		model.addAttribute("memberInfo", mInfo); //정보 담았어 
		MemberVO user = (MemberVO) session.getAttribute("user"); //로그인한 사람의 정보 (세션에서 가져옴)
		System.out.println("member"+user);
		
		return "memberUpdate.member";

	}
	
	@RequestMapping(value="memberDelete", method=RequestMethod.POST)
	public String delete(MemberVO vo) throws Exception{
		//memberService.deleteMember(vo.getMemberNum());
		return "redirect:memberList";
	}
	
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
	
	//회원가입 시 인증메일 보내는 메서드
	@RequestMapping(value="mailCheck", method=RequestMethod.GET)
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
