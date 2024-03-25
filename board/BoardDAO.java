package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;

public class BoardDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String getAllSQL = "select * from announcement"; 
	private String insertSQL = "insert into announcement(title, content, category, authorid, publishdate) values(?,?,?,?,?)";
	
	public List<BoardDTO> getAllAnnouncement(){
		ArrayList<BoardDTO> boardList = new ArrayList<>();
		
		con=MyDBConnection.getConnection();
		try {
			pstmt=con.prepareStatement(getAllSQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO bDTO = new BoardDTO();
				bDTO.setNoticeId(rs.getInt(1));
				bDTO.setTitle(rs.getString(2));
				bDTO.setContent(rs.getString(3));
				bDTO.setCategory(rs.getString(4));
				bDTO.setAuthorId(rs.getString(5));
				bDTO.setPublishdate(rs.getDate(6));
				bDTO.setImg(rs.getString(7));
				
				boardList.add(bDTO);
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return boardList;
	}
	
	public void insertAnnounce(String title,String category,String content,String publishDate,String authorId) {
		con=MyDBConnection.getConnection();
		try {
			pstmt=con.prepareStatement(insertSQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, category );
			pstmt.setString(4, authorId);
			pstmt.setString(5, publishDate);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		
	}
	
}
