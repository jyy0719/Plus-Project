package com.project.plus.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class ChatController {

	
//	   @GetMapping("/")
//	    public String rooms(Model model){
//	        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
//	        return "rooms";
//	    }
//
//	    @GetMapping("/rooms/{id}")
//	    public String room(@PathVariable String id, Model model){
//	        ChatRoom room = chatRoomRepository.findRoomById(id);
//	        model.addAttribute("room",room);
//	        return "room";
//	    }
//
//	    @GetMapping("/new")
//	    public String make(Model model){
//	        ChatRoomForm form = new ChatRoomForm();
//	        model.addAttribute("form",form);
//	        return "newRoom";
//	    }
//
//	    @PostMapping("/room/new")
//	    public String makeRoom(ChatRoomForm form){
//	        chatRoomRepository.createChatRoom(form.getName());
//
//	        return "redirect:/";
//	    }
}
