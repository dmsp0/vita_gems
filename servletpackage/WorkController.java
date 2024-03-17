package servletpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import work.WorkDAO;
import work.WorkDTO;

@WebServlet("*.workDo")
public class WorkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WorkController() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String URI = request.getRequestURI();
		final String PATH =	URI.substring(URI.lastIndexOf("/"));
		
		if(PATH.equals("/workSearchView.workDo")) {
			WorkDAO wDAO = new WorkDAO();
			List<WorkDTO> wDTOlist = wDAO.getAllAttendance();
			
			request.setAttribute("wDTOlist", wDTOlist);
			RequestDispatcher dispatcher = request.getRequestDispatcher("workSearchView.jsp");
			dispatcher.forward(request, response);
		}
		
		/*
		 * String view =""; String action = request.getParameter("action");
		 * 
		 * if(action==null) {
		 * getServletContext().getRequestDispatcher("/workSearchView.*?action=list")
		 * .forward(request, response); } else { //list,detailSearch, upload
		 * switch(action) { case "list" : view = list(request, response); break; case
		 * "detailSearch" : view = detailSearch(request, response); break; //case
		 * "upload" : view = upload(request, response); break; }
		 * getServletContext().getRequestDispatcher(view).forward(request, response);
		 * 
		 * }
		 */
		}
	
		/*
		 * public String list(HttpServletRequest request, HttpServletResponse response)
		 * { request.setAttribute("workSearch", wdao.getAllAttendance()); return
		 * "workSearchView.jsp"; }
		 * 
		 * public String detailSearch(HttpServletRequest request, HttpServletResponse
		 * response){ request.setAttribute("detailWorkSearch",
		 * wdao.getDetailAttendance()); return "workDetailSearchView.jsp"; }
		 */
		
		/*
		 * //#1. 사용자 요청이 들어오면 요청 경로(path)를 추출 final String URI =
		 * request.getRequestURI(); final String PATH =
		 * URI.substring(URI.lastIndexOf("/")); //요청에 따라 처리하기 //#1.전체 근태 조회
		 * if(PATH.equals("workSearchView.jsp")) { WorkDAO wDAO = new WorkDAO();
		 * List<WorkDTO> wDTOList = wDAO.getAllAttendance();
		 * 
		 * request.setAttribute("wDTOList", wDTOList); RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("workSearchView.jsp");
		 * dispatcher.forward(request, response); // workSearchView.jsp 페이지로 포워딩
		 * 
		 * }else if(PATH.equals("/workSearchView.detailSearch")) { // 개별사원조회
		 * System.out.println("나라"); } else
		 * if(PATH.equals("/employeeRegisterView.employeeDo")){//사원등록 EmployeeDAO eDAO =
		 * new EmployeeDAO(); eDAO.registEmployee(); RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("employeeSearchView.employeeDo");
		 * dispatcher.forward(request, response);
		 */
	
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 * 
	 * 
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { doGet(request, response); }
	 */

}
