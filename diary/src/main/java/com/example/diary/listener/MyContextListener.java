package com.example.diary.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class MyContextListener implements ServletContextListener{
	
	public void contextDestroyed(ServletContextEvent sce)  { 
        
    }

	
    public void contextInitialized(ServletContextEvent sce)  { 
    	//application.setAttribute()
         sce.getServletContext().setAttribute("currentCnt", 1);
         System.out.println("MyContextListener currentCnt ->"+sce.getServletContext().getAttribute("currentCnt"));
    }

}
