package com.project.plus.domain;

public class ChatRoomVO {
	
	
//	
//	
//    private String roomId;
//    private String name;
//    private Set<WebSocketSession> sessions = new HashSet<>();
//
//    public static ChatRoom create(String name){
//        ChatRoom chatRoom = new ChatRoom();
//        chatRoom.roomId = UUID.randomUUID().toString();
//        chatRoom.name = name;
//        return chatRoom;
//    }
//	
//    private Map<String, ChatRoom> chatRoomMap;
//
//    @PostConstruct
//    private void init(){
//        chatRoomMap = new LinkedHashMap<>();
//    }
//
//    public List<ChatRoom> findAllRoom(){
//        List chatRooms = new ArrayList<>(chatRoomMap.values());
//        Collections.reverse(chatRooms);
//        return chatRooms;
//    }
//
//    public ChatRoom findRoomById(String id){
//        return chatRoomMap.get(id);
//    }
//
//    public ChatRoom createChatRoom(String name){
//        ChatRoom chatRoom = ChatRoom.create(name);
//        chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
//        return chatRoom;
//    }
}
