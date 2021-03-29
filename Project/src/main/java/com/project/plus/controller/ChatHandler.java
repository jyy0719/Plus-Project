package com.project.plus.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.plus.domain.ChatVO;
import com.project.plus.service.ChatService;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class ChatHandler extends TextWebSocketHandler {

	@Autowired
	ChatService chatService;
	
		private final ObjectMapper objectMapper = new ObjectMapper();
	    // 채팅방 목록 <방 번호, 방에 해당하는 session의 리스트>
	    private Map<Integer, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<Integer, ArrayList<WebSocketSession>>();
	    // session, 방 번호가 들어간다.
	    private Map<WebSocketSession, Integer> sessionList = new ConcurrentHashMap<WebSocketSession, Integer>();
	   
        private static int people;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		people++;
		log.info("채팅 접속 >> " + session.getId() + ", 접속 총 인원 : " + people);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String textMsg = message.getPayload();
		log.info("넘어온 메시지는 : " + textMsg);
		ChatVO chat = objectMapper.readValue(textMsg, ChatVO.class);
		
		//해당 채팅룸이 있는지 없는지 확인하기 위해 roomId 구하기 (+ 채팅방 번호 clubNum으로 생성)
		int roomId = chatService.checkRoomId(chat.getClubNum());
		log.info("클럽 넘버 " + roomId);
		//chat.getMemberNickname();
		// 채팅방 생성 
		 if(RoomList.get(roomId) == null && chat.getChatMessage().equals("ENTER") && roomId != 0) {
			
			 // 채팅방에 들어갈 session들
			 ArrayList<WebSocketSession> roomSessions = new ArrayList<>();
	           
	            // 현재 세션을 roomSessions에 추가
	            roomSessions.add(session);
	            // sessionList에 현재 세션을 clubNum(roomId)와 함께 추가
	            sessionList.put(session, roomId);
	            // RoomList에 추가
	            RoomList.put(roomId, roomSessions);
	            
	            log.info(">>>>> 채팅방 생성완료 -- " + RoomList.get(roomId));
	        
	      // 채팅방 입장 
		 }else if(RoomList.get(roomId) != null && chat.getChatMessage().equals("ENTER") && roomId != 0) {
	            
			 // 해당하는 방번호에 세션을 추가한다 
	            RoomList.get(roomId).add(session);
	            // sessionList에 추가
	            sessionList.put(session, roomId);
	            log.info(">>>>> 채팅방 입장");
	            
	            
	       // 입장 메시지가 아닌 채팅 메시지만 받았을 시에는 세션을 또 생성하면 안된다. 
		 } else if (RoomList.get(roomId) != null && !chat.getChatMessage().equals("ENTER") && roomId != 0) {
	                // 메세지에 이름, 이메일, 내용을 담는다.
	                TextMessage textMessage = new TextMessage(chat.getMemberNickname() + "," + chat.getChatMessage());
	                log.info(roomId + " : " + textMessage);
	                log.info(roomId + " : " + RoomList.get(roomId));
	                
	                // 현재 session 수
	                int sessionCount = 0;
	     
	                // 해당 채팅방의 session에 뿌려준다.
	                for(WebSocketSession curSessions : RoomList.get(roomId)) {
	                	curSessions.sendMessage(textMessage);
	                    log.info(">>>>> 해당 채팅방에 메시지 전송");
	                    sessionCount++;
	                    log.info("세션 개수 : " + sessionCount);
	                    
	                }
	                
		 }
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		 people--;
		   if(sessionList.get(session) != null) {
			   // sessionList에서 해당하는 세션을 통해 방 번호를 찾고, 그 방에 들어있는 세션을 지운다 
	            RoomList.get(sessionList.get(session)).remove(session);
	            sessionList.remove(session);
	            log.info("연결 끝");
	        }
	}

}
