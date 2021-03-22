//package com.project.plus.controller;
//// mypage-1vs1inquiry.jsp
//
//import java.lang.annotation.Annotation;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.project.plus.domain.InquiryVO;
//import com.project.plus.service.InquiryService;
//
//@Controller
//public class InquiryController {
//
//	private InquiryService is;
//	
//	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("inquiry controller");
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("data", "Hello spring MVC");
//		mv.setViewName("WEB-INF/views/inquiry.jsp");
//		
//		return mv;
//	}
//
//
//	@RequestMapping("/insertInquiry.do")
//	public String insertInquiry(InquiryVO vo) {
//			System.out.println("글 등록 처리");
//			is.insertInquiry(vo);
//			return "getInquiryList.do";
//	}
//
//	@RequestMapping("/updateInquiry.do")
//	public String updateInquiry(InquiryVO vo) {
//		System.out.println("글 수정 처리");
//		is.updateInquiry(vo);
//		return "getInquiryList.do";
//	}
//
//	@RequestMapping("/deleteInquiry.do")
//	public String deleteInquiry(InquiryVO vo) {
//		System.out.println("글 삭제 처리");
//		is.deleteInquiry(vo);
//		return "getInquiryList.do";
//	}
//
//	@RequestMapping("/getInquiry.do")
//	public String getInquiry(InquiryVO vo, Model model) {
//		System.out.println("글 상세 조회");
//		model.addAttribute("inquiry", is.getInquiry(vo, model));
//		return "getInquiry.jsp";
//	}
//
//	@RequestMapping("/getInquiryList.do")
//	public String getInquiryList(InquiryVO vo, Model model) {
//		System.out.println("글 목록 조회");
//		model.addAttribute("inquiryList", is.getInquiryList(vo, model));
//		is.getInquiryList(vo, model);
//		return "getInquiryList.jsp";
//	}
//
//	public Class<? extends Annotation> annotationType() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public String value() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//}
//
//
