package Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Manager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import entity.Member;

public class CheckLoginInterceptor implements HandlerInterceptor {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		//Manager manager=(Manager) request.getSession().getAttribute("manager");
		String  manager=(String) request.getSession().getAttribute("manager");
		if(manager==null){
			response.sendRedirect(request.getContextPath()+"/managers/managerLogin");
			return false;
		}
		return true;
	}
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView mav) throws Exception {
	}
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exception)
			throws Exception {
	}
}
