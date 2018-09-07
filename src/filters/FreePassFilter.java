package filters;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FreePassFilter extends HttpFilter {

	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		Cookie[] ar = request.getCookies();
		if (ar != null) {
			chain.doFilter(request, response);
		} else {
			for (int i = 0; i < ar.length; i++) {
				Cookie c = ar[i];
				String name = c.getName();
				String value = c.getValue();
				String path = c.getPath();
				String domain = c.getDomain();
				int maxage = c.getMaxAge();
				
			}
		}
	}
}
