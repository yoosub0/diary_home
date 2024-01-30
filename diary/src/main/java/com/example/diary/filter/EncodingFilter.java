package com.example.diary.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter {
   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
         throws IOException, ServletException {
      
      // 요청전
      request.setCharacterEncoding("utf-8");
      chain.doFilter(request, response);
      // 요청후
      request.setCharacterEncoding("utf-8");
   }
}
