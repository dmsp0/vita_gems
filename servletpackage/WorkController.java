package servletpackage;

import java.io.BufferedReader;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser; // JSON 문자열을 파싱하기 위한 클래스도 import해야 합니다.
import org.json.simple.parser.ParseException;
import org.json.simple.JSONArray;

import java.util.Map;
import java.util.HashMap;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
		
		else if(PATH.equals("/workDetailSearchView.workDo")) {
			String employeeCode = request.getParameter("employeeCode");
			WorkDAO wDAO = new WorkDAO();
			List<WorkDTO> wdDTOlist = wDAO.getDetailAttendance(employeeCode);
			List<WorkDTO> wdtDTOlist = wDAO.getAlldateofAttendance(employeeCode);
			
			request.setAttribute("modifyCode", employeeCode); // 수정하기 위해 가져갈 사원코드
			request.setAttribute("wdDTOlist", wdDTOlist);
			request.setAttribute("wdtDTOlist", wdtDTOlist);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("workDetailSearchView.jsp");
			dispatcher.forward(request, response);
			
		} 
		
		else if(PATH.equals("/workModifyView.workDo")) {
			String employeeCode = request.getParameter("employeeCode");
			WorkDAO wDAO = new WorkDAO();
			List<WorkDTO> wdDTOlist = wDAO.getDetailAttendance(employeeCode);
			List<WorkDTO> wdtDTOlist = wDAO.getAlldateofAttendance(employeeCode);
			
			request.setAttribute("modifyCode", employeeCode); // 수정하기 위해 가져갈 사원코드
			request.setAttribute("wdDTOlist", wdDTOlist);
			request.setAttribute("wdtDTOlist", wdtDTOlist);
			RequestDispatcher dispatcher = request.getRequestDispatcher("workModifyView.jsp");
			dispatcher.forward(request, response);
			
		} else if(PATH.equals("/workUpdate.workDo")) {
			request.setCharacterEncoding("utf-8");
			  response.setContentType("text/html;charset=utf-8");
			  WorkDAO wDAO = new WorkDAO();
			  System.out.println("dkdkdkdkdkdkdkdkdk");
			    // JSON 데이터를 담을 문자열 변수
			    BufferedReader bufferedReader = request.getReader();
			    StringBuilder stringBuilder = new StringBuilder();
			    String line =null;
			     while ((line = bufferedReader.readLine()) != null) {
			            stringBuilder.append(line);
			        }
			    // JSON 데이터를 담은 문자열 변수
			    String jsonInput = stringBuilder.toString();   

			    // JSON 문자열을 JSONObject로 변환
			    JSONParser parser = new JSONParser();
			    
			    try {
					JSONObject jsonObject = (JSONObject) parser.parse(jsonInput);
					
					String employeeCode = (String)jsonObject.get("employeeCode");
					JSONArray statusArray = (JSONArray) jsonObject.get("statusArray");
					
					// JSONObject에서 키와 값을 가져와서 java map으로 변환
					// JSON 배열을 순회하며 Map으로 변환합니다.
		            Map<Date, String> statusMap = new HashMap<>();
		            for (Object statusObj : statusArray) {
		                JSONObject statusJson = (JSONObject) statusObj;
		                
		                
		                DateTimeFormatter dateformat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		                LocalDate lacalDate = LocalDate.parse((String)statusJson.get("date"),dateformat);
		                java.sql.Date convertedDate = java.sql.Date.valueOf(lacalDate);
		                
		               // Date date = (Date) statusJson.get("date");
		                
		                String status = (String) statusJson.get("status");
		                statusMap.put(convertedDate, status);
		            }
		            WorkDTO workdtostatusMap = new WorkDTO();
		            workdtostatusMap.setStatusMap(statusMap);
//		            someService.processWorkStatus(WorkDTO);
		            
		            wDAO.startUpdateStatus(employeeCode, workdtostatusMap.getStatusMap());   // workdtostatusMap.getStatusMap();
		            response.sendRedirect("workDetailSearchView.workDo?employeeCode=" + employeeCode);
			    
			    } catch (ParseException e) {
					e.printStackTrace();
				}
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
	 **/ 
	 //------------------------------------------------------
	
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * request.setCharacterEncoding("utf-8");
	 * response.setContentType("text/html;charset=utf-8"); WorkDAO wDAO = new
	 * WorkDAO(); // JSON 데이터를 담을 문자열 변수 BufferedReader bufferedReader =
	 * request.getReader(); StringBuilder stringBuilder = new StringBuilder();
	 * String line =null; while ((line = bufferedReader.readLine()) != null) {
	 * stringBuilder.append(line); } // JSON 데이터를 담은 문자열 변수 String jsonInput =
	 * stringBuilder.toString();
	 * 
	 * // JSON 문자열을 JSONObject로 변환 JSONParser parser = new JSONParser();
	 * 
	 * try { JSONObject jsonObject = (JSONObject) parser.parse(jsonInput);
	 * 
	 * String employeeCode = (String)jsonObject.get("employeeCode"); JSONArray
	 * statusArray = (JSONArray) jsonObject.get("statusArray");
	 * 
	 * // JSONObject에서 키와 값을 가져와서 java map으로 변환 // JSON 배열을 순회하며 Map으로 변환합니다.
	 * Map<Date, String> statusMap = new HashMap<>(); for (Object statusObj :
	 * statusArray) { JSONObject statusJson = (JSONObject) statusObj; Date date =
	 * (Date) statusJson.get("date"); String status = (String)
	 * statusJson.get("status"); statusMap.put(date, status); } WorkDTO
	 * workdtostatusMap = new WorkDTO(); workdtostatusMap.setStatusMap(statusMap);
	 * // someService.processWorkStatus(WorkDTO);
	 * 
	 * wDAO.startUpdateStatus(employeeCode, statusMap); //
	 * workdtostatusMap.getStatusMap();
	 * response.sendRedirect("workDetailSearchView.workDo?employeeCode=" +
	 * employeeCode);
	 * 
	 * } catch (ParseException e) { e.printStackTrace(); }
	 * 
	 * 
	 * 
	 * 
	 * }
	 */
	  //----------------------------------------------------------
			/*
			 * public String parseJSON(String requestChangeStatusData) { StringBuffer result
			 * = new StringBuffer("");
			 * 
			 * // 유효성 체크 if(requestChangeStatusData == null) { requestChangeStatusData=""; }
			 * 
			 * 
			 * 
			 * }
			 */
	 
	  
	  
	 

}


