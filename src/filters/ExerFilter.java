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
		// ��������ǿ� ������ ��Ÿ���� Ű��
		//boolean b = (Boolean)session.getAttribute("auth");
		if(session.getAttribute("auth")!=null) {
			// ������ ���
			chain.doFilter(request, response);
		}else {
			// ������ �α������� �����̷�Ʈ
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
	}
	
	// ���Ͱ� was����� �Բ� �Ҹ�ɶ�
	public void destroy() {
		System.out.println("TestFilter.destroy");
	}
}
