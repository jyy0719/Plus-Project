package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.AdminService;

@Controller
//@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private AdminService ads;
	
	// 글 상세 조회
	@GetMapping("/getAdminInquiry")
	public String getAdminInquiry(InquiryVO vo, Model model) {
		model.addAttribute("adminInquiry", ads.getAdminInquiry(vo));
		return "getAdminInquiry.adinqu";
	}
	
	// 관리자용 모든 글 보기 : 게시판 목록 조회
	@RequestMapping("/adminInquiry")
	public String getAdminInquiryList(InquiryVO vo, Model model) {
		model.addAttribute("adminInquiryList", ads.getAdminInquiryList(vo));
		return "adminInquiry.adinqu";
	}
	
	// 문의글 삭제
	@RequestMapping("/deleteAdminInquiry")
	public String deleteAdminInquiry(InquiryVO vo) {
		ads.deleteAdminInquiry(vo);
		return "redirect:adminInquiry";
	}
		

	
	@RequestMapping("/adminChart")
	public String getAdminChart(MemberVO mvo, Model model) {
		model.addAttribute("adminChart", ads.getAdminChart(mvo));
		return "charttest.adch";
	}
	

	@RequestMapping("/answerInquiryForm")
	public String answerInquiryForm(InquiryVO vo, Model model) {
		System.out.println("여기까진 오는거 맞죠?");
		model.addAttribute("answerInquiryForm", ads.answerInquiryForm(vo));
		System.out.println("controller의 vo" + vo);
		return "inquiryAnswerForm.adinqu";
	}

	// 관리자용 : 답변 등록
	@RequestMapping("/answerInquiry")
	public String answerInquiry(InquiryVO vo, Model model) {
		ads.answerInquiry(vo);
		return "redirect:getAdminInquiry";
	}
}
