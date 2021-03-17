package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.ReviewVO;
import com.project.plus.service.ReviewService;

//주석입니다 , 나중에 지우세요 
@Controller
@SessionAttributes("review") // 값 변동이 없어도 review라는 이름에 같이 담겨서 나올 수 있도록.
public class ReviewController {
	
	@Autowired //자동 주입 , 아래의 객체 타입을 읽어들여서, 자동으로 해당 클래스의 객체를 생성한다.
	private ReviewService reviewService;	 

	
	@RequestMapping("/getReviewList.do")
		//	RequestMapping보다 먼저 적용되어서 아래 Map객체는 자동으로 Model에 저장되고
		//	화면 이동시 전달되게 된다
//	@ModelAttribute("selectNotReview")
	public String getReviewList(ReviewVO vo, Model model) {
		//reviewList라는 이름으로 reviewService.selectNotReview(vo)의 값을 담아서 jsp로 넘김.
		vo.setMemberNum(5);
		model.addAttribute("selectNotReview", reviewService.selectNotReview(vo)); 
		model.addAttribute("selectOkayReview", reviewService.selectOkayReview(vo)); 
		
		return "reviewList";
	}
}

