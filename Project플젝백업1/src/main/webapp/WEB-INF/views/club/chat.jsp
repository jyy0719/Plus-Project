<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>채팅</title>
    <style>
    
	    .chat-wrap{
	  		margin-top:10px;
	    	display:flex;
	  		justify-content: center;
	  		
	    }
	    
    	.chatRoomList{
    		width:400px;
    		border:1px solid #dddddd;
    		margin-right:10px;
    	}
    	
    	.chatRoom{
    		height:50px;
    		border-bottom:1px solid #dddddd;
    	}
    
        .chat-box {
            width: 600px;
            height: 700px;
            border: 1px solid #dddddd;
           /*  margin: 0 auto; */
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

        }

        .time-date {
            color: #747474;
            ;

        }

        .other-message-box {
            /* position: relative; */
            width: 300px;
            display: flex;
            flex-direction: column;
            margin: 10px 0 0 5px;
            padding-left: 10px;
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
        }

        .mymessage {
            /* position:relative; */
            /* float:right; */
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
            /* position:absolute; */
            height: 20px;
            margin-bottom:10px; 

        }


	     .send-message {
            display: flex;
            flex-direction: row;
        } 


        #message {
            width: 550px;
            height: 37px;
            border:none;
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
        
        h2{
        	color:#dddddd;
        	text-align:center;
        }
        
        #enterBtn{
        	border: 0;
    		outline:0;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
</head>

<body>
<div class="chat-wrap">
	<div class="chatRoomList">
	<div class="header">채팅방 목록</div>
	<c:forEach items="${clubs}" var="club">
		<div class="chatRoom">${club.clubName}
		<input type="button" value="입장" id="enterBtn" onclick="enterRoom(${club.clubNum})"/>
		</div>
		<input type="hidden" id="clubNum" value="${club.clubNum}" />	
	</c:forEach>	
	</div>
    <div class="chat-box">
        <div class="header">
            메세지 ${user.memberNickname}
        </div>
        <div class="message-wrap" style="overflow:auto" >
       			<h2>채팅할 모임을 선택해주세요.</h2>
        </div>
            <div class="send-message">
          		<input placeholder="보낼 메세지를 입력해주세요." id="message"/>
                <input type="button" id="sendBtn" value="보내기"/> 
            </div>
    </div>
   </div>
</body>
<script type="text/javascript">
let myMessage = "";
let otherMessage = "";
let today="";
let sock;
let name ='${user.memberNickname}';

function connect(){
	sock = new SockJS("http://localhost:9999/plus/chat");
	sock.onopen = onopen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	console.log("세션 생성")
}

	function onopen() {
           console.log('info: connection opened.');
           // 연결될 때 채팅방마다 세션을 만들어줘야 한다. 
         //  sock.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
    };
    
    
   // sock.onerror = function (err) {
   // 	console.log('Errors : ' , err);  	
   // }
    
    
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$(".mymessage-box").append("연결 끊김");

	}
	
	
	
		let clubNum = $("#clubNum").val();
		console.log(clubNum)
    
	// 메시지 전송
	function sendMessage(clubNum) {
		let msg = $("#message").val();
		
		sock.send(msg);
		today = new Date();   
		myMessage = '<div class="mymessage-box">';
        myMessage += '<div class="mymessage">' + msg + '</div>';
        myMessage += '<div class="time-date" id="send-date">' + today.toLocaleDateString() +  ' | ' 
        			+ today.toLocaleTimeString("en-US") + '</div></div>';
        $('.message-wrap').append(myMessage);
		$('#message').val('');
		$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
		
		// 에이젝스로 메시지 저장 
		$.ajax({
			type: "post",
			data: {
				clubNum: clubNum,
				memberNum:'${user.memberNum}',
				chatMessage:msg
				
			},
			url: "/plus/insertMessage.do",
            success: function (data) {
            	console.log(data);
	           	if(data==1){
	           		console.log("메시지 저장 성공")
	           	} else{
	           		console.log("메세지 저장 실패")
	           		}
            	},
            error: function() {
            	  alert(" 채팅 error");
            	}
			}); 
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		let words = msg.data.split(':');
		let id = words[0];
		words = words[1].trim();
		today = new Date();  
			console.log(name)
			console.log(id)
		if(name!==id){
			otherMessage = '<div class="other-message-box">';
			otherMessage += '<div id="othername">' + id + '</div>';
			otherMessage += '<div class="others-message">' + words + '</div>';
			otherMessage += '<div class="time-date" id="receive-date">' + today.toLocaleDateString() 
						+  ' | ' + today.toLocaleTimeString("en-US") + '</div></div>';
		    $('.message-wrap').append(otherMessage);
			$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
		}
		
	}
	

		
		function enterKey(clubNum){
			if(event.keyCode == 13) {
				if($("#message").val() != null && $("#message").val() != '') {
					sendMessage(clubNum);
					$("#message").val('');
				}
			}
		}
		
	//	$(".chatRoom").click(function(){
		function enterRoom(clubNum){
			connect();
			$("h2").remove();
			$('.message-wrap').html('');
			$("#message").attr("onkeydown", "enterKey(" + clubNum + ")");
			$("#sendBtn").attr("onclick", "sendMessage()");
			
			
			// 채팅 내역 불러오기 
			$.ajax({
				type: "post",
				data: {
					clubNum:clubNum
				},
				url: "/plus/getMessages.do",
				success : function(data){        
					console.log("채팅내역 불러오기 성공");
					for(var i=0; i<data.length; i++){
					if(name===data[i].members.memberNickname){
						myMessage = '<div class="mymessage-box">';
					        myMessage += '<div class="mymessage">' + data[i].chatMessage + '</div>';
					        myMessage += '<div class="time-date" id="send-date">' + data[i].chatStringSendtime + '</div></div>';
					        $('.message-wrap').append(myMessage);
							$('#message').val('');
							$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
					} else{
						otherMessage = '<div class="other-message-box">';
							otherMessage += '<div id="othername">' + data[i].members.memberNickname + '</div>';
							otherMessage += '<div class="others-message">' + data[i].chatMessage + '</div>';
							otherMessage += '<div class="time-date" id="receive-date">' + data[i].chatStringSendtime + '</div></div>';
						    $('.message-wrap').append(otherMessage);
							$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
						
						}
					}
						
					
					
	            },
	            error: function() {
	            	  console.log(" 채팅내역 error");
	            	}
				});  
		}
			
	//	})
		

</script>
</html>