package com.project.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

	@RequestMapping(value="/inquiryForm", method=RequestMethod.GET)
	public String inquiryForm(InquiryVO vo, HttpSession session) throws Exception {
		vo.setMemberNum(12);
		is.inquiryForm(vo, session);
		System.out.println(vo.getMemberNum());	// 로그인을 해도 여기서 못받아오면 아무 소용이 없지않나요 일단은 그냥 넣을게요
		return "inquiryForm.inqu";
	}
	
	@RequestMapping(value="/writeInquiry", method=RequestMethod.POST)
	public String writeInquiry(InquiryVO vo) throws Exception {
		System.out.println("컨트롤러 진입 시도 성공!!");
		is.writeInquiry(vo);
		return "redirect:inquiry";
	}	
	
	@RequestMapping("/editInquiryForm")
	public String editInquiryForm(InquiryVO vo, Model model) {
		model.addAttribute("inquiryForm", is.editInquiryForm(vo));
		return "inquiryEditForm.inqu";
	}

	@RequestMapping(value="/editInquiry", method=RequestMethod.POST)
	public String editInquiry(InquiryVO vo) {
		is.editInquiry(vo);
		return "redirect:inquiry";
	}
	
	@RequestMapping("/deleteInquiry")
	public String deleteInquiry(InquiryVO vo) {
		is.deleteInquiry(vo);
		return "redirect:inquiry";
	}
	
	@GetMapping("/getInquiry")
	public String getInquiry(InquiryVO vo, Model model) {
		System.out.println("여기서 멤버 넘버가 누군데요 : " + vo);
		model.addAttribute("inquiry", is.getInquiry(vo));
		System.out.println("들어갔니?");
		return "getInquiry.inqu";
	}
	
	@RequestMapping("/inquiry")
	public String getInquiryList(InquiryVO vo, Model model) {
		model.addAttribute("inquiryList", is.getInquiryList(vo));
		return "inquiry.inqu";
	}
	
	/*
	 * @RequestMapping("/inquiryPerson.do") public String
	 * getInquiryPersonList(InquiryVO vo, Model model) {
	 * model.addAttribute("inquiryPersonList", is.getInquiryPersonList(vo)); return
	 * "inquiry"; }
	 * 
	 * @RequestMapping("/inquiryType.do") public String getInquiryTypeList(InquiryVO
	 * vo, Model model) { model.addAttribute("inquiryTypeList",
	 * is.getInquiryTypeList(vo)); return "inquiry"; }
	 */
}


