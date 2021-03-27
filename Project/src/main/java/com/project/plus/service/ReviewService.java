package com.project.plus.service;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.ReviewVO;

public interface ReviewService {
	List<ReviewVO> selectNotReview(ReviewVO vo); 
	List<ReviewVO> selectOkayReview(ReviewVO vo); 
	void insertReview(ReviewVO vo);
	String reviewList();
	public List<ReviewVO> getReviews(int clubNum);
	public List<ReviewVO> getMoreReviews(Map<String,Integer> map);
<<<<<<< HEAD
	public int getReviewCount();
	
	//정연 하단 추가 20210326
	ReviewVO readReview(ReviewVO vo);
	void updateReview(ReviewVO vo);
	void deleteReview(ReviewVO vo);
=======
	public int getReviewCount(int clubNum);
>>>>>>> cc7b2e2ad58d9bf5737df9772dbfd322bad86475
}
