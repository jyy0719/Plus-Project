package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.service.AnnounceService;

@Controller
@SessionAttributes("announce")
public class AnnounceController {
	
	@Autowired
	private AnnounceService announceService;
	
	@RequestMapping("/insertAnnounce.do")
	public String insertAnnounce(AnnounceVO vo) throws Exception {
		announceService.insertAnnounce(vo);	
		return "getAnnounceList.do";
	}
	
	@RequestMapping("/updateAnnounce.do")
	public String updateAnnounce(@ModelAttribute("announce") AnnounceVO vo) {
		System.out.println(vo);
		announceService.updateAnnounce(vo);
		return "getAnnounceList.do";
	}
	
	@RequestMapping("/deleteAnnounce.do")
	public String deleteAnnounce(AnnounceVO vo) {
		announceService.deleteAnnounce(vo);
		return "getAnnounceList.do";
	}
	
	@RequestMapping("/getAnnounce.do")
	public String getAnnounce(AnnounceVO vo, Model model) {
		model.addAttribute("announce", announceService.getAnnounce(vo));
		return "getAnnounce";
	}
	
	@RequestMapping("/getAnnounceList.do")
	public String getAnnounceList(AnnounceVO vo, Model model) {
		
		model.addAttribute("AnnounceList", announceService.getAnnounceList(vo));
		return "getAnnounceList";
	}
}
