package com.project.plus.mapper;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.ReviewVO;

public interface ReviewMapper {
	
		public List<ReviewVO> selectNotReview(ReviewVO vo);
		public List<ReviewVO> selectOkayReview(ReviewVO vo);
		public void insertReview(ReviewVO vo);
		public String reviewList();
		public List<ReviewVO> getReviews(int clubNum);
		public List<ReviewVO> getMoreReviews(Map<String,Integer> map);
<<<<<<< HEAD
		public int getReviewCount();
		
		//20210326 정연 하단 추가
		public ReviewVO readReview(ReviewVO vo);
		public void updateReview(ReviewVO vo);
		public void deleteReview(ReviewVO vo);
=======
		public int getReviewCount(int clubNum);
>>>>>>> cc7b2e2ad58d9bf5737df9772dbfd322bad86475
}
