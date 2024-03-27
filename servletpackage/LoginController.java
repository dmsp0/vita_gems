package servletpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.LoginDAO;
import login.LoginDTO;




@WebServlet(urlPatterns = {"/loginComplete", "/logout"})
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginController() {
        super();
    }
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//이거 해야 한글처리 제대로함
		
		 String id = request.getParameter("id");
	     String password = request.getParameter("pw");
	     
	     boolean isValidUser = validateUser(id, password);
	     
	     if (isValidUser) {
	    	 HttpSession session = request.getSession(); 
	    	 session.setAttribute("user", id);
	    	 System.out.println("세션에 user라는 이름으로 입력한 id저장");
	    	 
	    	 session.setAttribute("userName",getUserName(id));
	    	 System.out.println("세션에 userName라는 이름으로 employeeName저장");
	    	 
	    	 request.setAttribute("id", id);
	    	 System.out.println("request에 user라는 이름으로 입력한 id저장");
	    	// 위의 두 줄이 세션 생성 및 사용자 정보 저장
	            RequestDispatcher dispatcher = request.getRequestDispatcher("welcomeView.jsp");
	            dispatcher.forward(request, response);
	        } else {
	        	System.out.println("아이디혹은 비밀번호가 틀립니다.");
	        	response.sendRedirect("index.jsp?error=1");
	        }
	        
	}

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
			HttpSession session = request.getSession(false);
			if(session !=null) {
				System.out.println("세션제거");
				session.invalidate();
			}
			response.sendRedirect("index.jsp");
		}
	
	
	
	private boolean validateUser(String id, String password) {
		// 여기에 사용자 검증 로직 구현하기
		LoginDAO loginDao = new LoginDAO();
		LoginDTO loginDto = new LoginDTO();
		loginDto.setEmployeeCode(id);
		loginDto.setEmployeePassword(password);
		
		return loginDao.doLogin(loginDto);
	}
	
	private String getUserName(String id) {
		String userName = null;
		LoginDAO loginDao = new LoginDAO();
		userName = loginDao.getUserName(id);
		return userName;
	}
	
}