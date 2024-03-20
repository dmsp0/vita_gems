package employee;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;

public class EmployeeDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String getAllEmployeeSQL = "select * from hrinformation";
	private String selectEmployeeSQL = "select * from hrinformation where employeeCode = ?";
	private String registEmployeeSQL = "insert into HRInformation(employeeName,birthday,phoneNum,department,employeeRank,joinDate,gender,authority) values(?,?,?,?,?,?,?,?)";
	private String updateEmployeeSQL = "update hrinformation "
			+ "set employeeName=?, gender=?, phoneNum=?, address=?, department=?, employeeRank=?, joinDate=?, authority=? "
			+ "where employeecode = ?";
	
	
	public List<EmployeeDTO> getAllEmployee() {
		ArrayList<EmployeeDTO> arreDTO = new ArrayList<>();
		con=MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(getAllEmployeeSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EmployeeDTO eDAO = new EmployeeDTO();
				
				eDAO.setEmployeeName(rs.getString(1));
				eDAO.setBirthday(rs.getDate(2));
				eDAO.setPhonenum(rs.getString(3));
				eDAO.setDepartment(rs.getString(4));
				eDAO.setEmployeeRank(rs.getString(5));
				eDAO.setJoinDate(rs.getDate(6));
				eDAO.setEmployeeCode(rs.getString("employeeCode"));
				arreDTO.add(eDAO); // 리스트에 DTO 객체를 추가합니다.
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return arreDTO;// 모든 사원 정보를 담은 리스트를 반환합니다.
	}
	
	public void registEmployee(String employeeName,String birthday,String gender,String phoneNum,String department,String employeeRank,String joinDate,String authority) {
		con=MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(registEmployeeSQL);
			pstmt.setString(1, employeeName);
			pstmt.setString(2, birthday);
			pstmt.setString(3, phoneNum);
			pstmt.setString(4, department);
			pstmt.setString(5, employeeRank);
			pstmt.setString(6, joinDate);
			pstmt.setString(7, gender);
			pstmt.setString(8, authority);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	
	public EmployeeDTO selectEmployee(String employeeCode) {//사원정보 불러서 담아서 return
		EmployeeDTO eDTO = new EmployeeDTO();
		con = MyDBConnection.getConnection();
		try {
			pstmt=con.prepareStatement(selectEmployeeSQL);
			pstmt.setString(1, employeeCode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				eDTO.setAddress(rs.getString("address"));
				eDTO.setAuthority(rs.getString("authority"));
				eDTO.setBankAccountNum(rs.getString("bankAccountNum"));
				eDTO.setBirthday(rs.getDate("birthday"));
				eDTO.setDepartment(rs.getString("department"));
				eDTO.setEmail(rs.getString("email"));
				eDTO.setEmployeeCode(rs.getString("employeeCode"));
				eDTO.setEmployeeName(rs.getString("employeeName"));
				eDTO.setEmployeePassword(rs.getString("employeepassword"));
				eDTO.setEmployeePhoto(rs.getString("employeePhoto"));
				eDTO.setEmployeeRank(rs.getString("employeeRank"));
				eDTO.setGender(rs.getString("gender"));
				eDTO.setJoinDate(rs.getDate("joinDate"));
				eDTO.setPhonenum(rs.getString("phoneNum"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return eDTO;
	}
	
	public void updateEmployee(String employeeCode,String employeeName,String gender,String phoneNum,String address,String department,String employeeRank,String joinDate,String authority) {
		con=MyDBConnection.getConnection();
		try {
			pstmt=con.prepareStatement(updateEmployeeSQL);
			pstmt.setString(1, employeeName);
			pstmt.setString(2, gender);
			pstmt.setString(3, phoneNum);
			pstmt.setString(4, address);
			pstmt.setString(5, department);
			pstmt.setString(6, employeeRank);
			pstmt.setString(7, joinDate);
			pstmt.setString(8, authority);
			pstmt.setString(9, employeeCode);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	
	
	 
}
