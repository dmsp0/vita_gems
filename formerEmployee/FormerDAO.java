package formerEmployee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import dbconnection.MyDBConnection;

public class FormerDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 나중에 사진도 추가하기
	private String insertFormerEmployeeSQL = "insert into formerEmployeeInformation(employeeCode,employeeName,department,employeeRank,joinDate,departureDate,birthday,gender,phoneNum,email,address,bankAccountNum) values(?,?,?,?,?,?,?,?,?,?,?,?)";

	public void registFormerEmployee(String employeeCode, String employeeName, String department,
			String employeeRank, String joinDate,String departureDate,
			String birthday,String gender,String phoneNum,String email,
			String address, String bankAccountNum) {
		
		con=MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(insertFormerEmployeeSQL);
			pstmt.setString(1, employeeCode);
			pstmt.setString(2, employeeName);
			pstmt.setString(3, department);
			pstmt.setString(4, employeeRank);
			pstmt.setString(5, joinDate);
			pstmt.setString(6, departureDate);
			pstmt.setString(7, birthday);
			pstmt.setString(8, gender);
			pstmt.setString(9, phoneNum);
			pstmt.setString(10, email);
			pstmt.setString(11, address);
			pstmt.setString(12, bankAccountNum);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	
}
