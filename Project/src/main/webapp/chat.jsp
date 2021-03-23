<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .chat-wrap {
            width: 600px;
            height: 700px;
            border: 1px solid #dddddd;
            margin: 0 auto;
        }

        .header {
            height: 50px;
            border-bottom: 1px solid #dddddd;
            font-weight: 500;
            padding-top: 10px;
            text-align: center;
        }

        .message-wrap {
            height: 600px;
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
            /* margin: 10px 0 0 5px; */
            border-radius: 15px;
            word-break: break-all;
        }


        #receive-date {
            height: 20px;
            margin-bottom: 40px;

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
            /* margin-top:40px; */

        }


        .send-message {
            display: flex;
            flex-direction: row;
            border-top: 1px solid #dddddd;
        }


        textarea {
            width: 550px;
            height: 45px;
            border: none;
            resize: none;
            z-index: 0;
        }

        #sendBtn {
            border: none;
            outline: none;
            background-color: white;
            color: #001eff;
            border-radius: 2px;
            height: 45px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>

<body>
    <div class="chat-wrap">
        <div class="header">
            CHAT
        </div>
        <div class="message-wrap">
            <div class="other-message-box">
                <div id="othername">pearjin15</div>
                <div class="others-message">
                    안녕하세요?
                </div>
                <span class="time-date" id="receive-date">2021/03/08 | 11:01 AM</span>
            </div>
            <div class="mymessage-box">
                <div class="mymessage">
                    환영합니다.dkssuddkssuddkssuddksusdusussdsdsdsdsdsdsdsdsdsdssd
                </div>
                <div class="time-date" id="send-date">2021/03/08 | 11:01 AM</div>
            </div>
        </div>
        <form>
            <div class="send-message">
                <textarea placeholder="보낼 메세지를 입력해주세요." id="message"></textarea>
                <input type="submit" id="sendBtn" value="보내기">
            </div>
        </form>
    </div>
</body>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost:8080/plus/chat");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$(".other-message-box").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$(".mymessage-box").append("연결 끊김");

	}
</script>
</html>