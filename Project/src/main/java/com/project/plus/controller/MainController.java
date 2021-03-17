package com.project.plus.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.service.MainService;



@Controller
public class MainController {

	@Autowired
	private MainService service;

	//@RequestMapping(method = RequestMethod.GET ...)와 동일한 기능
	@GetMapping(value="/main.do")
	// 뷰에 데이터를 전달한다.
	public void mainList(Model model) {
		model.addAttribute("main1", service.getListBest()); // key=main1, value=인기 더하기 리스트 
		model.addAttribute("main2", service.getListDeadline()); // key=main2, value=마감임박 더하기 리스트
	}

	// 전체보기
	@GetMapping(value="/getPlusList.do")
	public String getPlusListInfo(ClubVO vo, Model model) {
		System.out.println("더하기 리스트 전체 보기");
		model.addAttribute("total",service.getPlusListInfo(vo));
		return "totalInfo";
	}
	
	//검색 결과
	@GetMapping("/searchList.do")
	public void list(Criteria cri, Model model) {

		//한 페이지에 최대 20개 데이터가 보인다.
		cri.setAmount(20);
		model.addAttribute("cri", cri);

		//검색 결과 리스트를 보여준다.
		model.addAttribute("list", service.getListSearch(cri.getHeaderSearch)); // 검색 리스트를 list로 뷰에 보낸다.

	}
}