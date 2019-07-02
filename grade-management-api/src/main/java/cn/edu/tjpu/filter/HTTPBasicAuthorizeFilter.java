package cn.edu.tjpu.filter;

import cn.edu.tjpu.base.ResponseCode;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.config.ApiWhiteData;
import cn.edu.tjpu.utils.JWTUtils;
import cn.edu.tjpu.utils.JsonUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.util.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * API 调用权限控制
 * @author yinjihuan
 *
 */
public class HTTPBasicAuthorizeFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		ServletContext context = filterConfig.getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setCharacterEncoding("UTF-8");
        httpResponse.setContentType("application/json; charset=utf-8");
        httpResponse.setHeader("Access-Control-Allow-Origin", "*");
        httpResponse.setHeader("Access-Control-Allow-Credentials", "true");
        httpResponse.setHeader("Access-Control-Allow-Methods", "*");
        httpResponse.setHeader("Access-Control-Allow-Headers", "Content-Type,Authorization");
        httpResponse.setHeader("Access-Control-Expose-Headers", "*");
        String auth = httpRequest.getHeader("Authorization");
        //白名单，放过
		System.out.println(httpRequest.getRequestURI().toString());
        if (ApiWhiteData.getWhiteApis().contains(httpRequest.getRequestURI())|| httpRequest.getRequestURI().contains("file/download")|| httpRequest.getRequestURI().contains(".js") ||httpRequest.getRequestURI().contains(".css")) {
        	chain.doFilter(httpRequest, response);
        	return;
		}
        System.err.println(auth);
        //验证TOKEN
        if (!StringUtils.hasText(auth)) {
			PrintWriter print = httpResponse.getWriter();
        	print.write(JsonUtils.toJson(ResponseData.fail("非法请求【缺少Authorization信息】", ResponseCode.NO_AUTH_CODE.getCode())));
            return;
		}
        JWTUtils.JWTResult jwt = JWTUtils.checkToken(auth);
		if (!jwt.isStatus()) {
			PrintWriter print = httpResponse.getWriter();
			print.write(JsonUtils.toJson(ResponseData.fail(jwt.getMsg(), jwt.getCode())));
			return;
		}

		chain.doFilter(httpRequest, response);
	}

	@Override
	public void destroy() {

	}

}
