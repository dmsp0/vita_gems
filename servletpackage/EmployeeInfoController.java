package servletpackage;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.EmployeeDAO;
import employee.EmployeeDTO;




@WebServlet("*.employeeDo")
public class EmployeeInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EmployeeInfoController() {
        super();
    }
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//#1. 사용자 요청이 들어오면 요청 경로(path)를 추출
    			request.setCharacterEncoding("UTF-8");//이거 해야 한글처리 제대로함
    			final String URI = request.getRequestURI();
    			final String PATH =	URI.substring(URI.lastIndexOf("/"));
//    			
//    			//요청에 따라 처리하기
    			//#1.전체사원조회
    			if(PATH.equals("/employeeSearchView.employeeDo")) {
    				EmployeeDAO eDAO = new EmployeeDAO();
    				List<EmployeeDTO> eDTOList = eDAO.getAllEmployee();
    			
    			request.setAttribute("eDTOList", eDTOList);
    			RequestDispatcher dispatcher = request.getRequestDispatcher("employeeSearchView.jsp");
    		    dispatcher.forward(request, response); // employeeSearchView.jsp 페이지로 포워딩
    				
    			}else if(PATH.equals("/employeeModifyView.employeeDo")) { // 사원정보수정페이지
    				System.out.println("사원정보수정");
    				String employeeCode = request.getParameter("employeeCode");
    				System.out.println(employeeCode);
    				EmployeeDAO eDAO = new EmployeeDAO();
    				request.setAttribute("eDTOInfo",eDAO.selectEmployee(employeeCode));
    				RequestDispatcher dispatcher = request.getRequestDispatcher("employeeModifyView.jsp");
					dispatcher.forward(request, response);
					
    			}else if(PATH.equals("/employeeRegisterView.employeeDo")){//사원등록
    				//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    				EmployeeDAO eDAO = new EmployeeDAO();
    				String employeeName = request.getParameter("employeeName");
    				String birthday = request.getParameter("birthday");
    				String gender = request.getParameter("gender");
    	            String phoneNum = request.getParameter("employeephoneNum");
    	            String department = request.getParameter("department");
    	            String employeeRank = request.getParameter("employeeRank");
    	            String joinDate = request.getParameter("employeeJoinDate");
    	            String authority = request.getParameter("authority");
    				
						eDAO.registEmployee(employeeName,birthday,gender,phoneNum,department,employeeRank,joinDate,authority);
						//employeeSearchView.employeeDo로 dispatch하기
						RequestDispatcher dispatcher = request.getRequestDispatcher("employeeSearchView.employeeDo");
						dispatcher.forward(request, response);
    			}else if(PATH.equals("/employeeModifyComplete.employeeDo")) {//수정사항 업데이트
    				EmployeeDAO eDAO = new EmployeeDAO();
    				String employeeCode = request.getParameter("employeeCode");
    				String employeeName = request.getParameter("employeeName");
    				String gender = request.getParameter("gender");
    				String phoneNum = request.getParameter("employeephoneNum");
    				String address = request.getParameter("address");
    				String department = request.getParameter("department");
    	            String employeeRank = request.getParameter("employeeRank");
    	            String joinDate = request.getParameter("employeeJoinDate");
    	            String authority = request.getParameter("authority");
    	            
    	            eDAO.updateEmployee(employeeCode, employeeName, gender, phoneNum, address, department, employeeRank, joinDate, authority);
    	            RequestDispatcher dispatcher = request.getRequestDispatcher("employeeSearchView.employeeDo");
					dispatcher.forward(request, response);
    			}
    	
    }
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
