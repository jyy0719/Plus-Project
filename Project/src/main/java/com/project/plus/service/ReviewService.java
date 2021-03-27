package com.project.plus.service;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.ReviewVO;

public interface ReviewService {
	// 리뷰 적어야할 리스트 - 리턴타입 reviewVO로 해야지 model 에서 값 넘길 때 vo로 값 담아서 보낼 수 있음 
	List<ReviewVO> selectNotReview(ReviewVO vo); 
	// 리뷰 적은 리스트 - 리턴타입 reviewVO로 해야지 model 에서 값 넘길 때 vo로 값 담아서 보낼 수 있음 
	List<ReviewVO> selectOkayReview(ReviewVO vo); 
	void insertReview(ReviewVO vo);
	String reviewList();
	public List<ReviewVO> getReviews(int clubNum);
	public List<ReviewVO> getMoreReviews(Map<String,Integer> map);
	public int getReviewCount(int clubNum);
}
