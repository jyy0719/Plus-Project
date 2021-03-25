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

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class ChatHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList;

	private ChatHandler() {
		sessionList = new ArrayList<>();
	}

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
		String memid="";
		if (map.get("user") != null) {
			memid = (String) map.get("userNickname");
		}
		for (WebSocketSession currentSession : sessionList) {
			currentSession.sendMessage(new TextMessage(memid + " : " + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
	




}
