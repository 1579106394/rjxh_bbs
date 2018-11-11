package com.rjsys.bbs.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//登录拦截器，只拦截发帖功能
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
//		String requestURI = request.getRequestURI();
//		//可以获得是否是登录页面，登录页面我们不进行拦截。
//		//不进行拦截：登录、注册、找回密码，帖子列表、查看帖子、点赞、搜索
//		boolean flag  = !requestURI.contains("action") &&
//						!requestURI.contains("/login") &&
//						!requestURI.contains("/register") &&
//						!requestURI.contains("/index") &&
//						!requestURI.contains("/retrieve") &&
//						!requestURI.contains("/newCart") &&
//						!requestURI.contains("/search") &&
//						!requestURI.contains("/cartList") &&
//						!requestURI.contains("/zhaohui") &&
//						!requestURI.equals(request.getContextPath()+"/") &&
//						!requestURI.matches(".*\\d+.*")
//						;
//
//		if(flag) {
//			User user = (User) request.getSession().getAttribute("user");
//			if(null == user) {
//				response.sendRedirect(request.getContextPath() + "/login.jsp");
//				return false;
//			}
//
//
//		}
		return true;
	}

}
