package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.InquiryVO;
import com.project.plus.service.InquiryService;

@Controller
@SessionAttributes("inquiry")
public class InquiryController {

	@Autowired
	private InquiryService is;

	// return 어디로 할지가 아직 정리가 안됨

	// 회원용 : 문의글 등록
	@RequestMapping(value = "/writeInquiry.do", method = RequestMethod.POST)
	public String writeInquiry(InquiryVO vo) throws Exception {
		vo.setMemberNum(12);
		is.writeInquiry(vo);
		return "redirect:inquiry.do";
	}
	

	// 회원용 : 문의글 수정
	@RequestMapping(value = "/editInquiry.do", method = RequestMethod.POST)
	public String editInquiry(@ModelAttribute("inquiry") InquiryVO vo) {
		vo.setMemberNum(12);
		is.editInquiry(vo);
		return "redirect:inquiry.do";
	}

	// 문의글 삭제
	@RequestMapping("/deleteInquiry.do")
	public String deleteInquiry(InquiryVO vo) {
		is.deleteInquiry(vo);
		return "redirect:inquiry.do";
	}

	// 문의글 상세조회
	@RequestMapping(value = "/getInquiry.do", method = RequestMethod.GET)
	public String getInquiry(InquiryVO vo, Model model) {
		model.addAttribute("inquiry", is.getInquiry(vo));
		return "getInquiry";
	}

	// 모든 글 보기 : 게시판 목록 조회
	@RequestMapping("/inquiry.do")
	public String getInquiryList(InquiryVO vo, Model model) {
		model.addAttribute("inquiryList", is.getInquiryList(vo));
		return "inquiry";
	}

	// 아직 구현 못한 부분

	// 관리자용 : 답글 달기
	/*
	 * @RequestMapping(value="/answerInquiry.do", method=RequestMethod.POST) public
	 * String answerInquiry(@ModelAttribute("inquiry")InquiryVO vo) {
	 * is.answerInquiry(vo); return "inquiryAnswerForm"; }
	 */

	// 폼으로 보내기인데 이거 필요없을것 같음
	/*
	 * @RequestMapping(value = "/answerInquiry.do", method = RequestMethod.POST)
	 * public String answerInquiry(@ModelAttribute("inquiry") InquiryVO vo) {
	 * is.answerInquiry(vo); return "inquiryAnswerForm"; }
	 */
	
	
	/*
	 * @RequestMapping(value = "/answerForm.do", method = RequestMethod.POST) public
	 * String answerForm(InquiryVO vo, HttpServletRequest request, HttpSession
	 * session) throws Exception { is.addAnswer(vo);
	 * 
	 * int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
	 * System.out.println(inquiryNum); session = request.getSession();
	 * session.setAttribute("inquiryNum", inquiryNum); return "inquiryAnswerForm";
	 * // 답글창 요청시 미리 부모 글 번호를 inquiryNum속성으로 세션에 저장 }
	 */
	
	
	/*
	 * @RequestMapping(value = "/addAnswer.do", method = RequestMethod.POST) public
	 * String addAnswer(InquiryVO vo, HttpServletRequest request,
	 * HttpServletResponse response, HttpSession session) throws Exception { session
	 * = request.getSession(); int inquiryNum = (Integer)
	 * session.getAttribute("inquiryNum"); System.out.println(inquiryNum);
	 * vo.setInquiryNum(inquiryNum); // 답글의 부모 글 번호를 설정 String inquiryAnswer =
	 * (String) session.getAttribute("inquiryAnswer");
	 * vo.setInquiryAnswer(inquiryAnswer); vo.setMemberNum(1); is.writeInquiry(vo);
	 * return "redirect:inquiry.do";
	 * 
	 * }
	 */


//	// 회원용 : 회원별로 개별 리스트 보기
//	@RequestMapping("/inquiryPerson.do")
//	public String getInquiryPersonList(InquiryVO vo, Model model) {
//		model.addAttribute("inquiryPersonList", is.getInquiryPersonList(vo));
//		return "inquiry";
//	}
//
//	// 관리자용 : 카테고리별로 리스트 보기
//	@RequestMapping("/inquiryType.do")
//	public String getInquiryTypeList(InquiryVO vo, Model model) {
//		model.addAttribute("inquiryTypeList", is.getInquiryTypeList(vo));
//		return "inquiry";
//	}
}
