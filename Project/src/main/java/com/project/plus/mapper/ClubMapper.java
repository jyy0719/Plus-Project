package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ChatRoomVO;
import com.project.plus.domain.ClubVO;

public interface ClubMapper {
	public void insertClub(ClubVO vo);
	public ClubVO getClub(ClubVO vo);
	public List<String> getClubHashtag();
	public ClubVO getMyClubInfo(ClubVO vo);
	public int updateClub(ClubVO vo);
	public void deleteClub(ClubVO vo);
	public int apply(ApplyVO apply);
	public Integer getOneApply(ApplyVO apply);
	public List<ClubVO> getChatList(int memNum);
	public ChatRoomVO getMessages(int clubNum);
	public int insertMessage(ChatRoomVO msg);
	
	//정연하단 추가 20210326

	public ClubVO selectClub(ClubVO vo);
}
