package filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ExerFilter extends HttpFilter{
	
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		// 사용저세션에 인증을 나타내는 키가
		//boolean b = (Boolean)session.getAttribute("auth");
		if(session.getAttribute("auth")!=null) {
			// 있으면 통과
			chain.doFilter(request, response);
		}else {
			// 없으면 로그인으로 리다이렉트
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
	}
	
	// 필터가 was종료와 함께 소멸될때
	public void destroy() {
		System.out.println("TestFilter.destroy");
	}
}
