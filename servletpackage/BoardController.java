package servletpackage;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;


@WebServlet("*.boardDo")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BoardController() {
        super();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//#1. 사용자 요청이 들어오면 요청 경로(path)를 추출
		request.setCharacterEncoding("UTF-8");//이거 해야 한글처리 제대로함
		final String URI = request.getRequestURI();
		final String PATH =	URI.substring(URI.lastIndexOf("/"));
    	
		if(PATH.equals("/boardView.boardDo")){
			BoardDAO boardDAO= new BoardDAO();
			List<BoardDTO> boardListDTO = boardDAO.getAllAnnouncement();
			
			request.setAttribute("boardList", boardListDTO);
			RequestDispatcher dispatcher = request.getRequestDispatcher("boardView.jsp");
		    dispatcher.forward(request, response); // employeeSearchView.jsp 페이지로 포워딩
		}else if(PATH.equals("/boardWriteView.boardDo")) {
			BoardDAO bDAO = new BoardDAO();
			String title=request.getParameter("title");
			String category= request.getParameter("category");
			String content = request.getParameter("content");
			String publishDate = request.getParameter("hiddenCurrentTime");
			String authorId = request.getParameter("authorId");
			System.out.println(title + category + content + publishDate+authorId);
			
			bDAO.insertAnnounce(title, category, content, publishDate, authorId);
			
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("boardView.boardDo");
		    dispatcher.forward(request, response); // employeeSearchView.jsp 페이지로 포워딩
		}else if(PATH.equals("/boardDetailView.boardDo")) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("boardDetailView.jsp");
		    dispatcher.forward(request, response); // employeeSearchView.jsp 페이지로 포워딩
		}else if(PATH.equals("/boardUpdateView.boardDo")) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("boardUpdateView.jsp");
		    dispatcher.forward(request, response); // employeeSearchView.jsp 페이지로 포워딩
		}
		
    	
    	
    }
    


}
