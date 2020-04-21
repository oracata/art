package com.artesyn.resource.filter;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.artesyn.resource.user.entity.User;

public class AuthoricationInterceptor implements HandlerInterceptor {
	private static final String[] IGNORE_URI = { "/login", "/tologin", "index" };

	/**
	 * 该方法将在整个请求完成之后执行，主要作用是用于清理资源， 该方法也只能在preHandle方法的返回值为true才会执行
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	/**
	 * 该方法将在Controller的方法调用之后执行,方法可以对modelandview进行操作
	 * 该方法也只能在preHandle方法的返回值为true才会执行
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView view)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String basePath = request.getServletPath();
		for (String s : IGNORE_URI) {
			if (basePath.contains(s)) {
				return true;
			}
		}
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) { 
			//处理ajax请求
			if (request.getHeader("x-requested-with") != null
					&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
				PrintWriter out = response.getWriter();
                out.print("unlogin");//返回给前端页面的未登陆标识
				out.flush();
				out.close();
				return false;	
			} else {
				request.setAttribute("msg", "请登录");
			}
			request.getRequestDispatcher("/user/tologin").forward(request, response);// 转发到登录界面
			return false;
		} else
			return true;
	}

}
