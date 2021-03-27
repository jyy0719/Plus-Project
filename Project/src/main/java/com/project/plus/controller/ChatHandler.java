package com.project.plus.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.plus.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class ChatHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList;

	private ChatHandler() {
		sessionList = new ArrayList<>();
	}
//	
//    public static ChatRoom create(String name){
//        ChatRoom chatRoom = new ChatRoom();
//        chatRoom.roomId = UUID.randomUUID().toString();
//        chatRoom.name = name;
//        return chatRoom;
//    }

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		log.info("채팅 접속 >> " + session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("메세지전송 >> " + session.getId() + " : " +  message.getPayload());
		// 로그인 아이디 - WebSocket 등록
		Map<String, Object> map = session.getAttributes();
		String nickname="";
		if (map.get("user") != null) {
			MemberVO member = (MemberVO) map.get("user");
			nickname = member.getMemberNickname();
		}
		
		for (WebSocketSession currentSession : sessionList) {
			// 내 메시지라면 보내지 않는다 
			if(!currentSession.getId().equals(session.getId()))
				currentSession.sendMessage(new TextMessage(nickname + " : " + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
	




}
