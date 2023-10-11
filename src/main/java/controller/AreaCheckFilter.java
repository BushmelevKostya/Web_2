package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.rmi.ServerException;

public class AreaCheckFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		Filter.super.init(filterConfig);
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		String referer = httpServletResponse.getHeader("Referer");
		if (referer != null && referer.equals("http://localhost:8080/Gradle___web_app___Web_2_1_0_SNAPSHOT_war/controller")) {
			chain.doFilter(request, response);
		} else {
			throw new ServerException("False address used");
		}
	}
	
	@Override
	public void destroy() {
		Filter.super.destroy();
	}
}
