<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>채팅</title>
<style>
.chat-wrap {
	margin-top: 10px;
	display: flex;
	justify-content: center;
}

.chatRoomList {
	width: 400px;
	/* border: 1px solid #dddddd; */
	margin-right: 10px;
	    height: 360px;
}

.chatRoom {
	height: 50px;
	border-bottom: 1px solid #dddddd;
	display: flex;
    align-items: center;
    justify-content: space-between;
}

.chat-box {
	width: 600px;
	height: 700px;
	border: 1px solid #dddddd;
}

.header {
	height: 50px;
	border-bottom: 1px solid #dddddd;
	font-weight: 500;
	padding-top: 10px;
	text-align: center;
}

.message-wrap {
	height: 610px;
	overflow-y: scroll;
	padding-top: 10px;
}

.time-date {
	color: #747474;
}

.other-message-box {
	width: 300px;
	display: flex;
	flex-direction: column;
	margin: 10px 0 0 5px;
	padding-left: 10px;
	    margin-bottom: 5px;
}

#othername {
	height: 20px;
	margin-bottom: 10px;
}

.others-message {
	width: 300px;
	background-color: #f1f0f0;
	border-radius: 2px;
	padding: 5px 5px 5px 5px;
	margin-bottom: 10px;
	border-radius: 15px;
	word-break: break-all;
}

#receive-date {
	height: 20px;
	margin-bottom: 10px;
}

.mymessage-box {
	display: flex;
	flex-direction: column;
	float: right;
	    margin-bottom: 5px;
}

.mymessage {
	margin-right: 10px;
	width: 300px;
	padding: 5px 5px 5px 5px;
	border-radius: 2px;
	background-color: #001eff;
	color: white;
	word-break: break-all;
	border-radius: 15px;
}

#send-date {
	height: 20px;
	margin-bottom: 10px;
}

.send-message {
	display: flex;
	flex-direction: row;
}

#message {
	width: 550px;
	height: 37px;
	border: none;
	resize: none;
	z-index: 0;
	border-top: 1px solid #dddddd;
}

#sendBtn {
	border: none;
	border-top: 1px solid #dddddd;
	outline: none;
	background-color: white;
	color: #001eff;
	border-radius: 2px;
	height: 37px;
}

h2 {
	color: #dddddd;
	text-align: center;
}
.clubName{
	margin-left:10px;
}

#enterBtn {
	border: 0;
	outline: 0;
	border-radius: 3px;
	float: right;
  	background-color: #001eff;
    color: white;
    margin-right: 10px;
}

.enterTxt{
	display: flex; 
	justify-content:center; 
	clear:both; 
	margin-bottom:30px;
	font-size: 15px;
}

.group-img{
	width:30px;
	height:30px;
	margin-right:10px;
}

.lists{
	width:400px;
	height:700px;
	border: 1px solid #dddddd;
}

.userList{
	width:400px;
	    height: 340px;
}

#exitBtn{
	display:none;
	float: left; 
	margin-left:10px;
}

#exitBtn img{
	height:30px;
	width:30px;
	cursor:pointer;
}

#total{
	float:right;
	margin-right:10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
</head>

<body>
	<div class="chat-wrap">
		<div class="lists">
		<div class="chatRoomList">
			<div class="header">채팅방 목록</div>
			<c:forEach items="${clubs}" var="club">
				<div class="chatRoom">
					<div class="clubName"><img class="group-img" src="${path}/resources/img/chat.png" />${club.clubName}</div>
					<input type="button" value="입장" id="enterBtn" class="btns"
						onclick="enterRoom(${club.clubNum});" />
				<input type="hidden" name="hiddenName" value="${club.clubName}" />
				</div>
			</c:forEach>
		</div>
			<div class="userList">
			</div>
		</div>
		<div class="chat-box">
			<div class="header" id="chatRoomName">
				<div id="exitBtn"><img src="${path}/resources/img/back-button.png" /></div>
				<div id="title">더하기</div>
				</div>
				<div class="message-wrap" style="overflow: auto">
					<h2>채팅할 모임을 선택해주세요.</h2>
				</div>
			<div class="send-message">
				<input placeholder="보낼 메세지를 입력해주세요." id="message" /> 
				<input type="button" id="sendBtn" value="보내기" />
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

$(function() {
	
	// 동적으로 채팅방 이름 바꾸기 
$(document).on('click', '#enterBtn', function(){	
	let clubName = $(this).parent('div').find("input[name='hiddenName']").val();
	console.log(clubName);
	$('#title').text(clubName);
	$('#exitBtn').css("display","block");
}); 
	
	// 나가기 버튼 클릭시 
$(document).on('click', '#exitBtn', function(){		
	    const data = {
	    	     "clubNum" : roomId,
	             "memberNickname" : name,
	        	 "chatMessage" : "LEAVE"
			};
		let jsonMsg = JSON.stringify(data);
		sock.send(jsonMsg);
		sock.close();
	
		if($('#total')){
			$('#total').remove();
		}
		
		$('.message-wrap').html('');
		let exit = '<h2>채팅할 모임을 선택해주세요</h2>';
		$('.message-wrap').html(exit);
		$('#sendBtn').attr("onclick", "");
		$('#message').attr("onkeydown","");
		$('#exitBtn').css("display","none");
		$('.btns').css( "visibility", "visible" );
		$('#title').text('더하기');
});
	
	

});


let myMessage = "";
let otherMessage = "";
let today="";
// 로그인한 유저 닉네임
let name ='${user.memberNickname}';
let roomId = "";	
	
	//	채팅방 입장 
	function enterRoom(clubNum){
		roomId = clubNum;
		console.log(" 입장한 모임 번호 : " + roomId);

		//입장할때마다 소켓에 연결 
		connect(roomId);
		
		
		$('h2').remove();
		$('.message-wrap').html('');
		
		$('#message').attr("onkeydown", "enterKey(" + roomId + ")");
		$('#sendBtn').attr("onclick", "sendMessage()");
		$('.btns').css( "visibility", "hidden" );
		
		// 채팅 내역 불러오기 
		$.ajax({
			type: "post",
			data: {
				clubNum:roomId
			},
			url: "/plus/getMessages",
			success : function(data){        
				console.log("채팅내역 불러오기 성공"); 
				for(var i=0; i<data.length; i++){
					if(name===data[i].members.memberNickname){
						myMessage = '<div class="mymessage-box">';
					        myMessage += '<div class="mymessage">' + data[i].chatMessage + '</div>';
					        myMessage += '<div class="time-date" id="send-date">' + data[i].chatStringSendtime + '</div></div>';
					        $('.message-wrap').append(myMessage);
							$('#message').val('');
					} else{
						otherMessage = '<div class="other-message-box">';
							otherMessage += '<div id="othername"><strong>' + data[i].members.memberNickname + '</strong></div>';
							otherMessage += '<div class="others-message">' + data[i].chatMessage + '</div>';
							otherMessage += '<div class="time-date" id="receive-date">' + data[i].chatStringSendtime + '</div></div>';
						    $('.message-wrap').append(otherMessage);
					
					}
				}
				$('.message-wrap').append('<div class="enterTxt"></div>');
				$('.enterTxt').append('<p><strong>' + name + "</strong>님이 입장하셨습니다.</p>");
				$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
            },
            error: function() {
            	  console.log(" 채팅내역 error");
            }
						
						
		});  
	}



	
	//input에서 엔터치면 메시지 전송 
	function enterKey(roomId){
		if(event.keyCode == 13) {
			if($("#message").val() != null && $("#message").val() != '') {
				sendMessage();
				$("#message").val('');
			}
		}
	}
	
	
	// 메시지 전송
	function sendMessage() {
		let msg = $("#message").val();
		console.log("메시지 전송 to : " + roomId);
	     const data = {
	    	       "clubNum" : roomId,
                   "memberNickname" : name,
             	   "chatMessage" : msg
         };
		let jsonMsg = JSON.stringify(data);
		sock.send(jsonMsg);
		
		today = new Date();   
		myMessage = '<div class="mymessage-box">';
        myMessage += '<div class="mymessage">' + msg + '</div>';
        myMessage += '<div class="time-date" id="send-date">' + today.toLocaleDateString() +  ' | ' 
        			+ today.toLocaleTimeString("en-US") + '</div></div>';
        $('.message-wrap').append(myMessage);
		$('#message').val('');
		$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
		
		// 메시지 db에 저장 
	 	$.ajax({
			type: "post",
			data: {
				clubNum: roomId,
				memberNum:'${user.memberNum}',
				chatMessage:msg
				
			},
			url: "/plus/insertMessage",
            success: function (data) {
            	console.log(data);
	           	if(data==1){
	           		console.log("메시지 저장 성공")
	           	} else{
	           		console.log("메세지 저장 실패")
	           		}
            	},
            error: function() {
            	  alert("메시지 저장 error");
            	}
			}); 
	}
	
	
	
	// 서버로부터 메시지를 받았을 때
	let people="";
	function onMessage(msg) {
		console.log(msg)
		let words = msg.data.split(',');
		let id = words[1];
		people = words[2];
		console.log(words)
		console.log("0번 : " + words[0]);
		console.log("1번 : " + words[1]);
		if(words[0]==="ENTER"){
			let total="";
			console.log(id);
			console.log(people);
			if(name!==id){
				// 입장 메시지 띄우기
				let enterTxt = '<div class="enterTxt">';
				enterTxt += '<p><strong>' + id + '</strong>님이 입장하셨습니다.</p></div>';
						$('.message-wrap').append(enterTxt);
						$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
			}		
				// 접속한 인원 띄우기 
				total = '<div id="total">('+ people + '명 접속중)</div>'		
				if($('#total')){
					$('#total').remove();
					$('#title').append(total);
				} else{
					$('#title').append(total);
				}
				
		} else if(words[0]==="LEAVE"){
			console.log(words[0]);
			people = words[2];
			let enterTxt = '<div class="enterTxt">';
			
			enterTxt += '<p><strong>' + id + '</strong>님이 퇴장하셨습니다.</p></div>';
					$('.message-wrap').append(enterTxt);
					$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
			
			total = '<div id="total">('+ people + '명 접속중)</div>'		
			if($('#total')){
				$('#total').remove();
				$('#title').append(total);
			} else{
				$('#title').append(total);
			}
		
		
		}else {
			let id = words[0];
			words = words[1].trim();
			console.log(words);
			
			today = new Date();  
				
			if(name!==id){
				otherMessage = '<div class="other-message-box">';
				otherMessage += '<div id="othername">' + id + '</div>';
				otherMessage += '<div class="others-message">' + words + '</div>';
				otherMessage += '<div class="time-date" id="receive-date">' + today.toLocaleDateString() 
							+  ' | ' + today.toLocaleTimeString("en-US") + '</div></div>';
			    $('.message-wrap').append(otherMessage);
				$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
			} else {
				console.log("자기 자신이 보냈음")
			}
		}
		
	}
	

	// 소켓 생성, 연결 
		let sock;
		function connect(clubNum){
			sock = new SockJS("http://localhost:9999/plus/chat");
			sock.onopen = onopen;
			sock.onmessage = onMessage;
			sock.onclose = onclose; 
			console.log("세션 생성" + clubNum)
		}

		//채팅 입장시 서버로 입장했다는 정보를 보낸다  
			function onopen() {
		           console.log('info: connection opened' + roomId);
		           
		           const data = {
		                   "clubNum" : roomId,
		                   "memberNickname" : name,
		               	   "chatMessage" : "ENTER"
		           };
		           
		           let jsonData = JSON.stringify(data);
		           sock.send(jsonData);    
		          }
			 
		    
			// 서버와 연결 끊겼을 때 
		 	function onclose(evt) {
				console.log("연결끊김");
				$(".mymessage-box").append("연결 끊김");
				

			} 



</script>
</html>