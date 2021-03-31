package com.project.plus.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.AnnounceService;
import com.project.plus.service.MemberService;

@Controller
public class AnnounceController {
	
	@Autowired
	private AnnounceService as;
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="/insertAnnounce", method = RequestMethod.POST)
	public String insertAnnounce(AnnounceVO vo) throws Exception {
		as.insertAnnounce(vo);	
	
		return "getAnnounceList";
	}
	
	@RequestMapping("/updateAnnounce")
	public String updateAnnounce(@ModelAttribute("announce") AnnounceVO vo) {
		System.out.println(vo);
		as.updateAnnounce(vo);
		return "getAnnounceList";
	}
	
	@RequestMapping("/deleteAnnounce")
	public String deleteAnnounce(AnnounceVO vo) {
		as.deleteAnnounce(vo);
		return "announce";
	}
	
	@RequestMapping("/getAnnounce")
	public String getAnnounce(AnnounceVO vo, Model model) {
		model.addAttribute("announce", as.getAnnounce(vo));
		return "getAnnounce";
	}
	
	@RequestMapping("/announce")
	public String getAnnounceList(AnnounceVO vo, MemberVO mvo, Model model, HttpSession session) {
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if(user == null) {
			System.out.println();
			return "login.login";
		} else {
			
			// 관리자 1번이면 
			model.addAttribute("announceList", as.getAnnounceList(vo));
			return "announce.ann";
			
		}
		
//		if(user.isEmpty()) {
//			System.out.println("로그인정보가 없는 비회원 입장");
//			return "";
//		}
//		else {
//			model.addAttribute("announceList", as.getAnnounceList(vo));
//			return "announce.ann";
//		}
		/*
		 * if(user.getMemberNum()==1) { model.addAttribute("announceList",
		 * as.getAnnounceList(vo)); return "announce.ann"; } else {
		 * System.out.println("다른 회원인가봐요"); model.addAttribute("announceList",
		 * as.getAnnounceList(vo)); return "announce.ann"; }
		 */
	
		//MemberVO manager = (MemberVO) session.getAttribute("user");
		
		/*
		 * model.addAttribute("announceList", as.getAnnounceList(vo)); return
		 * "announce.ann";
		 */
	}
}
