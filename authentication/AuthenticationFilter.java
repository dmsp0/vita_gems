package authentication;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
       
    
    public AuthenticationFilter() {
        super();
    }

   public void destroy() {
   }

   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      request.setCharacterEncoding("UTF-8");//이거 해야 한글처리 제대로함
        HttpServletRequest httpRequest = (HttpServletRequest) request;
           HttpServletResponse httpResponse = (HttpServletResponse) response;

           HttpSession session = httpRequest.getSession(false);
           String requestURI = httpRequest.getRequestURI();
           System.out.println(requestURI);
           
           //로그인페이지와 로그인 요청은 거르지 않음
           if (requestURI.endsWith("/vitagems/") || requestURI.endsWith("loginComplete")||requestURI.endsWith("index.jsp")||requestURI.endsWith("style.css")||requestURI.endsWith("vitagems_logo.png")) {//
               chain.doFilter(request, response);
               return;
           }
           
        // 세션에 사용자 정보가 없으면 로그인 페이지로 리다이렉트
           if (session == null || session.getAttribute("user") == null) {
              System.out.println("세션에 user가 null" + requestURI );
              System.out.println("잘못된접근입니다.");
              
               httpResponse.sendRedirect("index.jsp?error=2");
               return;
           }

      chain.doFilter(request, response);
   }

   public void init(FilterConfig fConfig) throws ServletException {
      // TODO Auto-generated method stub
   }

}