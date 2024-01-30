package com.example.diary.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.diary.service.CounterService;
import com.example.diary.vo.Counter;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
@Component
public class MySessionListener implements HttpSessionListener {
	@Autowired
	CounterService counterService;
    //view에서 application.getAttribute("currentCnt")를 호출하면 현재 접속자 수 출력가능
    public void sessionCreated(HttpSessionEvent se)  { 
        // 현재 접속자
    	int n = (Integer)(se.getSession().getServletContext().getAttribute("currentCnt"));
    	se.getSession().getServletContext().setAttribute("currentCnt", n+1);
    	System.out.println(se.getSession().getServletContext().getAttribute("currentCnt")+"<-- 접속자수 currentCnt");
    	//오늘 날짜의 누적 접속자
    	if(counterService.selectCntByToday() == null) {	// 오늘 첫 접속
    		counterService.insertCnt();
    	}else {	// 이미 접속자가 있었음
    		counterService.updateCnt();
    	}
    	
    }

	
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // -1
    	int n = (Integer)(se.getSession().getServletContext().getAttribute("currentCnt"));
    	se.getSession().getServletContext().setAttribute("currentCnt", n-1);
    }
}
