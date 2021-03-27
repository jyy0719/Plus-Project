package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.InquiryVO;
import com.project.plus.service.AdminService;
import com.project.plus.service.InquiryService;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private AdminService ads;
	
	// 문의글 삭제
	@RequestMapping("/deleteAdminInquiry.do")
	public String deleteAdminInquiry(InquiryVO vo) {
		ads.deleteAdminInquiry(vo);
		return "redirect:adminInquiry.do";
	}
	
	// 문의글 상세조회
	@RequestMapping(value = "/getAdminInquiry.do", method = RequestMethod.GET)
	public String getAdminInquiry(InquiryVO vo, Model model) {
		model.addAttribute("adminInquiry", ads.getAdminInquiry(vo));
		return "getAdminInquiry";
	}
	
	// 관리자용 모든 글 보기 : 게시판 목록 조회
	@RequestMapping("/adminInquiry.do")
	public String getAdminInquiryList(InquiryVO vo, Model model) {
		model.addAttribute("adminInquiryList", ads.getAdminInquiryList(vo));
		return "adminInquiry";
	}
	
	// 답변
	/*
	 * @RequestMapping(value = "/answerInquiry.do", method = RequestMethod.POST)
	 * public String answerInquiry(InquiryVO vo) {
	 * 
	 * 
	 * return "adminInquiry"; }
	 */
	/*
	 * @RequestMapping(value = "/answerForm.do", method = RequestMethod.POST) public
	 * String answerForm(@ModelAttribute("inquiry") InquiryVO vo) {
	 * vo.setMemberNum(1); is.addAnswer(vo); return "redirect:adminInquiry.do"; }
	 */
	

	/*
	 * // 관리자용 : 답변 등록
	 * 
	 * @RequestMapping(value = "/answerForm.do", method = RequestMethod.POST) public
	 * String answerForm(InquiryVO vo) throws Exception { vo.setMemberNum(1);
	 * as.answerForm(vo); return "redirect:adminInquiry.do"; }
	 */
	// 누가 이기나 한번 해보자
	@RequestMapping(value = "/answerInquiry.do", method = RequestMethod.POST)
	public String answerInquiry(@ModelAttribute("admin") InquiryVO vo) throws Exception {
		vo.setMemberNum(1);
		ads.answerInquiry(vo);
		return "inquiryAnswerForm";
	}
}
