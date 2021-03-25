package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomVO {

	private int messageNum;
	private int memberNum;
	private String memberNickname;
	private int clubNum;
	private String clubName;
	private String clubLeader;
	private Date chatSendDate;
	private Date chatOpenDate;
	private String chatMessage;
}
