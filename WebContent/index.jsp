<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html>
<html lang="zh">
<head>
 <base href="<%=basePath%>">  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>ChatRoom</title>

<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">

<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="alternate icon" href="assets/i/favicon.ico">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">

<!-- umeditor css -->
<link href="umeditor/themes/default/css/umeditor.css" rel="stylesheet">

<style>
.title {
    text-align: center;
}

.chat-content-container {
    height: 29rem;
    background-color: #FFFFFF;
    overflow-y: scroll;
    border: 1px solid silver;
}

</style>
</head>
<body>
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
 
</div> 
    <!-- title start -->
    <div class="title">
        <div class="am-g am-g-fixed">
            <div class="am-u-sm-12">
                <h1 class="am-text-primary">Privacy ChatRoom(私聊)</h1>
            </div>
        </div>
    </div>
    <!-- title end -->

    <!-- chat content start -->
  
     <div type="hidden" style="border: 0px solid silver; width: 95px;
	 height: 270px;float:left;"></div>
     <div class="chat-content" >
        <div class="am-g am-g-fixed chat-content-container" style="width: 770px;
	 height: 250px;float:left;">
            <div class="am-u-sm-12">
                <ul id="message-list" class="am-comments-list am-comments-list-flip"></ul>
            </div>           
        </div>
    </div>
   <div  id="userList" style="border: 1px solid silver; width: 100px; background-color: #FFFFFF;
	 height: 250px;float:left; overflow-y:scroll;">
	 <input type=checkbox id=test value="rachel">&nbsprachel <br/>
	 	 <input type=checkbox id=test value="kk">&nbspkk <br/>
	 	 	 	 <input type=checkbox id=test value="黄怡文">&nbsp黄怡文 <br/>	 
	 	 	 
	 </div>
	 
    
    <!-- chat content end -->

    <!-- message input start -->
    <div class="message-input am-margin-top">
        <div class="am-g am-g-fixed">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <div class="am-form-group">
                        <script type="text/plain" id="myEditor" placeholder="这里输入你想发送的信息..." style="width: 90%;height: 5rem;"></script>
                    </div>
                </form>
            </div>
        </div>
        <div class="am-g am-g-fixed am-margin-top">
            <div class="am-u-sm-6">
                <div id="message-input-nickname" class="am-input-group am-input-group-primary">
                    <span class="am-input-group-label"><i class="am-icon-user">&nbspusername&nbsp&nbsp:&nbsp&nbsp<%=request.getSession().getAttribute("username").toString() %></i></span>
                    <input id="nickname" type="hidden" class="am-form-field" value=<%=request.getSession().getAttribute("username").toString() %>>
                <div class="am-u-sm-6">
                <button id="send" type="button" class="am-btn am-btn-primary">
                    <i class="am-icon-send"></i> Send
                </button>
            </div>
                </div>
            </div>
            
        </div>
    </div>
    </div>
    <!-- message input end -->

    <!--[if (gte IE 9)|!(IE)]><!-->
    <script src="assets/js/jquery.min.js"></script>
    <!--<![endif]-->
    <!--[if lte IE 8 ]-->
    <script src="umeditor/third-party/jquery.min.js"></script>
    <!--[endif]-->

    <!-- umeditor js -->
    <script charset="utf-8" src="umeditor/umeditor.config.js"></script>
    <script charset="utf-8" src="umeditor/umeditor.min.js"></script>
    <script src="umeditor/lang/zh-cn/zh-cn.js"></script>
 
 
    <script>
        $(function() {
            // 初始化消息输入框
            var um = UM.getEditor('myEditor');
            // 使昵称框获取焦点
            $('#nickname')[0].focus();
            var socket = new WebSocket('ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/websocket?username=${sessionScope.username}');
          
            // 处理服务器端发送的数据
            socket.onmessage = function(event) {
                addMessage(event.data);
            };
            // 点击Send按钮时的操作
            $('#send').on('click', function() {
                var nickname = $('#nickname').val();
                var to = $("#userList :checked").val();
                if (!um.hasContents()) {    // 判断消息输入框是否为空
                    // 消息输入框获取焦点
                    um.focus();
                    // 添加抖动效果
                    $('.edui-container').addClass('am-animation-shake');
                    setTimeout("$('.edui-container').removeClass('am-animation-shake')", 1000);
                } else if (nickname == '') {    // 判断昵称框是否为空
                    //昵称框获取焦点
                    $('#nickname')[0].focus();
                    // 添加抖动效果
                    $('#message-input-nickname').addClass('am-animation-shake');
                    setTimeout("$('#message-input-nickname').removeClass('am-animation-shake')", 1000);
                } else {
                    // 发送消息
                    socket.send(JSON.stringify({
                        content : um.getContent(),
                        nickname : nickname,
                        to : to
                    }));
                    // 清空消息输入框
                    um.setContent('');
                    // 消息输入框获取焦点
                    um.focus();
                }
            });

            // 把消息添加到聊天内容中
            function addMessage(message) {
            	// var to = $("#userList :checked").val();
                message = JSON.parse(message);
                var messageItem = '<li class="am-comment '
                        + (message.isSelf ? 'am-comment-flip' : 'am-comment')
                        + '">'
                        + '<a href="javascript:void(0)" ><img src="assets/images/'
                        + (message.isSelf ? 'mei.png' : 'icon.jpg')
                        + '" alt="" class="am-comment-avatar" width="48" height="48"/></a>'
                        + '<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">'
                        + '<a href="javascript:void(0)" class="am-comment-author">'
                        + message.nickname +'  <span style="color:#E56717;">To</span>  '+message.to+ '</a> <time>' + message.date
                        + '</time></div></header>'
                        + '<div class="am-comment-bd">' + message.content
                        + '</div></div></li>';
                $(messageItem).appendTo('#message-list');
                // 把滚动条滚动到底部
                $(".chat-content-container").scrollTop($(".chat-content-container")[0].scrollHeight);
            }
        });

        
        
    </script>
</body>
</html>