package servletpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.chartDo")
public class HrChartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	//#1. 사용자 요청이 들어오면 요청 경로(path)를 추출
	    			request.setCharacterEncoding("UTF-8");//이거 해야 한글처리 제대로함
	    			final String URI = request.getRequestURI();
	    			final String PATH =	URI.substring(URI.lastIndexOf("/"));
	    			
	    			if(PATH.equals("/hrCharts.chartDo")) {
	    			
	    				RequestDispatcher dispatcher = request.getRequestDispatcher("companyHrChart.jsp");
	        		    dispatcher.forward(request, response);	
	    			}
	 }
}
