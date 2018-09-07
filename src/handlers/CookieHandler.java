package handlers;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieHandler implements ServletRequestListener {

	public void requestInitialized(ServletRequestEvent sre) {
		ServletRequest req = sre.getServletRequest();
		HttpServletRequest request = (HttpServletRequest) req;

		if (request.getSession().isNew()) {
			Cookie[] ar = request.getCookies();
			String freepass = null;
			if (ar != null) {
				for (int i = 0; i < ar.length; i++) {
					if (ar[i].getName().equals("freepass")) {
						freepass = ar[i].getValue();
					}
				}
			}
			if (freepass != null) {
				System.out.println("[CookieHandler] this client has a freepass cookie. value is" + freepass);
				request.getSession().setAttribute("auth", true);
			} else {
				System.out.println("[CookieHandler] this client does not have a freepass cookie");
			}
		}
	}
}