package com.hyw.chat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSONObject;

/**
 * 聊天服务器类
 * @author hyw
 *
 */
@ServerEndpoint("/websocket")
public class ChatServer {
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");    // 日期格式化

    private static Set<Session> sets = new HashSet<Session>();
    private static Map<String, Session> map = new HashMap<String, Session>();
    
    @OnOpen
    public void open(Session session) {
        // 添加初始化操作
    	 sets.add(session);
    	 System.out.println("aa");
    	 String queryString = session.getQueryString().toString();
    	 String username = queryString.substring(queryString.indexOf("=") + 1);
    	 map.put(username, session);
    	 System.out.println(username);
    }

    /**
     * 接受客户端的消息，并把消息发送给所有连接的会话
     * @param message 客户端发来的消息
     * @param session 客户端的会话
     */
    @OnMessage
    public void getMessage(String message, Session session) {
        // 把客户端的消息解析为JSON对象
        JSONObject jsonObject = JSONObject.fromObject(message);
        // 在消息中添加发送日期
        jsonObject.put("date", DATE_FORMAT.format(new Date()));
        // 把消息发送给所有连接的会话
        String to=jsonObject.get("to").toString();
        System.out.println(to);
        Session session2 = this.map.get(to);
        session2.getAsyncRemote().sendText(jsonObject.toString());
            // 添加本条消息是否为当前会话本身发的标志
        System.out.println("hi");

         jsonObject.put("isSelf", true);
            // 发送JSON格式的消息
         session.getAsyncRemote().sendText(jsonObject.toString());
        
    }
    
 
    @OnClose
    public void close(Session session) {
        // 添加关闭会话时的操作
    	sets.remove(session);
    }

    @OnError
    public void error(Throwable t) {
        // 添加处理错误的操作
    }
}