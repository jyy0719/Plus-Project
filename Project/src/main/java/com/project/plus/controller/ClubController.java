package com.project.plus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.plus.domain.ClubVO;
import com.project.plus.service.ClubService;

@Controller
public class ClubController {
	// 되는지 테스트 
	
	@Autowired
	private ClubService clubService;	
	
	@RequestMapping(value="/insertClub.do", method = RequestMethod.POST)
	public String insertClub(ClubVO vo) {
		System.out.println("controller 진입");
		clubService.insertClub(vo);	// DB에 저장
		return "index";
	}
	
	
	// 컬럼에 저장된 해시태그 list 가져와서 model에 저장 
	@ModelAttribute("tags")
	public List<String> getTags() {
		return clubService.getClubHashtag();
	}
	
	@RequestMapping("/getClub.do")
	public String getClubInfo(ClubVO vo, Model model) {
		System.out.println("클럽 상세정보 보기");
		model.addAttribute("club",clubService.getClubInfo(vo));
		return "clubInfo";
	}
	
	@RequestMapping("/getMyClubInfo.do")
	public String getMyClubInfo(ClubVO vo, Model model) {
		System.out.println("수정할 클럽의 폼 보여주기");
		model.addAttribute("club", clubService.getMyClubInfo(vo));
		return "/myClubInfo";
	}
	
	@RequestMapping("/updateClub.do")
	public String updateClub(ClubVO vo) {
		System.out.println("클럽 수정하기 완료");
		clubService.updateClub(vo);
		return "index";
	}
}
