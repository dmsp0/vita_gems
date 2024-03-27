package servletpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.EmployeeDAO;
import employee.EmployeeDTO;
import formerEmployee.FormerDAO;
import formerEmployee.FormerDTO;

@WebServlet("*.employeeDo")
public class EmployeeInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeInfoController() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// #1. 사용자 요청이 들어오면 요청 경로(path)를 추출
		request.setCharacterEncoding("UTF-8");// 이거 해야 한글처리 제대로함
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));
//    			
//    			//요청에 따라 처리하기
		// #1.전체사원조회
		if (PATH.equals("/employeeSearchView.employeeDo")) {
			EmployeeDAO eDAO = new EmployeeDAO();
			List<EmployeeDTO> eDTOList = eDAO.getAllEmployee();

			request.setAttribute("eDTOList", eDTOList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("employeeSearchView.jsp");
			dispatcher.forward(request, response); // employeeSearchView.jsp 페이지로 포워딩

		} else if (PATH.equals("/employeeModifyView.employeeDo")) { // 사원정보수정페이지
			System.out.println("사원정보수정");
			String employeeCode = request.getParameter("employeeCode");
			System.out.println(employeeCode);
			EmployeeDAO eDAO = new EmployeeDAO();
			request.setAttribute("eDTOInfo", eDAO.selectEmployee(employeeCode));
			RequestDispatcher dispatcher = request.getRequestDispatcher("employeeModifyView.jsp");
			dispatcher.forward(request, response);
		}

		else if (PATH.equals("/myPageModifyView.employeeDo")) { // 사원정보수정페이지
			System.out.println("사원정보수정");
			String employeeCode = request.getParameter("employeeCode");
			System.out.println(employeeCode);
			EmployeeDAO eDAO = new EmployeeDAO();
			request.setAttribute("eDTOInfo", eDAO.selectEmployee(employeeCode));
			RequestDispatcher dispatcher = request.getRequestDispatcher("myPageModifyView.jsp");
			dispatcher.forward(request, response);

		}

		else if (PATH.equals("/employeeRegisterView.employeeDo")) {// 사원등록
			// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			EmployeeDAO eDAO = new EmployeeDAO();
			String employeeName = request.getParameter("employeeName");
			String birthday = request.getParameter("birthday");
			String gender = request.getParameter("gender");
			String phoneNum = request.getParameter("employeephoneNum");
			String department = request.getParameter("department");
			String employeeRank = request.getParameter("employeeRank");
			String joinDate = request.getParameter("employeeJoinDate");
			String authority = request.getParameter("authority");

			eDAO.registEmployee(employeeName, birthday, gender, phoneNum, department, employeeRank, joinDate,
					authority);
			// employeeSearchView.employeeDo로 dispatch하기
			RequestDispatcher dispatcher = request.getRequestDispatcher("employeeSearchView.employeeDo");
			dispatcher.forward(request, response);
		}

		else if (PATH.equals("/employeeModifyComplete.employeeDo")) {// 수정사항 업데이트
			EmployeeDAO eDAO = new EmployeeDAO();
			String employeeCode = request.getParameter("employeeCode");
			String employeeName = request.getParameter("employeeName");
			String gender = request.getParameter("gender");
			String phoneNum = request.getParameter("employeephoneNum");

			String hiddenOldAddress = request.getParameter("hiddenOldAddress");

			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");

			String address = (address1 != null ? address1 : "") + (address2 != null ? address2 : "")
					+ (address3 != null ? address3 : "") + (address4 != null ? address4 : "");
			if (address.isEmpty()) {
				address = hiddenOldAddress;
				System.out.println(hiddenOldAddress);
			}
			String department = request.getParameter("department");
			String employeeRank = request.getParameter("employeeRank");
			String joinDate = request.getParameter("employeeJoinDate");
			String authority = request.getParameter("authority");

			eDAO.updateEmployee(employeeCode, employeeName, gender, phoneNum, address, department, employeeRank,
					joinDate, authority);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("employeeDetailView.employeeDo?employeeCode=" + employeeCode);
			dispatcher.forward(request, response);
		} else if (PATH.equals("/formerStart.employeeDo")) {// 퇴사처리 창으로
			System.out.println("사원정보수정");
			String employeeCode = request.getParameter("employeeCode");
			System.out.println(employeeCode);
			EmployeeDAO eDAO = new EmployeeDAO();
			request.setAttribute("eDTOInfo", eDAO.selectEmployee(employeeCode));
			RequestDispatcher dispatcher = request.getRequestDispatcher("formerCheckView.jsp");
			dispatcher.forward(request, response);

		}

		else if (PATH.equals("/employeeDetailView.employeeDo")) {
			String employeeCode = request.getParameter("employeeCode");
			System.out.println(employeeCode);
			EmployeeDAO eDAO = new EmployeeDAO();
			request.setAttribute("eDTOInfo", eDAO.selectEmployee(employeeCode));
			RequestDispatcher dispatcher = request.getRequestDispatcher("employeeDetailView.jsp");
			dispatcher.forward(request, response);
		}

		else if (PATH.equals("/myPage.employeeDo")) {
			String employeeCode = request.getParameter("employeeCode");
			System.out.println(employeeCode);
			EmployeeDAO eDAO = new EmployeeDAO();
			request.setAttribute("eDTOInfo", eDAO.selectEmployee(employeeCode));
			RequestDispatcher dispatcher = request.getRequestDispatcher("myPageView.jsp");
			dispatcher.forward(request, response);
		}

		else if (PATH.equals("/myPageUpdate.employeeDo")) {
			EmployeeDAO eDAO = new EmployeeDAO();

			String employeeCode = request.getParameter("employeeCode");
			String email = request.getParameter("email");
			String phoneNum = request.getParameter("phoneNum");
			String hiddenOldAddress = request.getParameter("hiddenOldAddress");

			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");

			String address = (address1 != null ? address1 : "") + (address2 != null ? address2 : "")
					+ (address3 != null ? address3 : "") + (address4 != null ? address4 : "");
			if (address.isEmpty()) {
				address = hiddenOldAddress;
				System.out.println(hiddenOldAddress);
			}
			String bankAccountNum = request.getParameter("bankAccountNum");

			eDAO.updateMyPage(employeeCode, email, phoneNum, address, bankAccountNum);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("myPage.employeeDo?employeeCode=" + employeeCode);
			dispatcher.forward(request, response);
		}

		
		  else if(PATH.equals("/processingResignation.employeeDo")) { // 퇴사 확인 후 처리해야함
			  System.out.println("들어왔다 임마");
			  FormerDAO fDAO = new FormerDAO();
			  	String employeeCode = request.getParameter("employeeCode"); // 코드
				String employeeName = request.getParameter("employeeName"); // 이름
				String department = request.getParameter("department"); // 부서
				String employeeRank = request.getParameter("employeeRank"); //직급
				String joinDate = request.getParameter("joinDate"); //입사일
				String departureDate = request.getParameter("departureDate"); //퇴사일
				String birthday = request.getParameter("birthday"); // 생년월일
				String gender = request.getParameter("gender"); //성별
				// 나중에 사진 추가하기
				String phoneNum = request.getParameter("employeephoneNum"); //전화번호
				String email = request.getParameter("email"); // 이메일
				String address = request.getParameter("address"); //주소
				String bankAccountNum = request.getParameter("bankAccountNum"); // 계좌번호
				
				// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				fDAO.registFormerEmployee(employeeCode, employeeName, department, employeeRank, joinDate, departureDate, birthday, gender, phoneNum, email, address, bankAccountNum);
		
		  //String employeeCode = request.getParameter("employeeCode"); //
		   //System.out.println("퇴사자 사원코드 : "+employeeCode);
		  
		 //EmployeeDTO eDTO = eDAO.selectEmployee(employeeCode);
			    RequestDispatcher dispatcher = request.getRequestDispatcher("employeeSearchView.employeeDo");
			    dispatcher.forward(request, response);
				
		  }
		 

	}

}
