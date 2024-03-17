package work;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;

public class WorkDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null ;
	private ResultSet rs = null;
	
	private String searchAttendanceSQL = "select employeeCode, employeeName, totalWorkCount, vacation, lateness, earlyLeave, absence from totalattendance";  
	private String searchDetailAttendanceSQL = "select * from totalattendance where employeeCode = ?";
	
	// 전사원 근태 내역
	public List<WorkDTO> getAllAttendance(){
		ArrayList<WorkDTO> allWorkInfo = new ArrayList<>();
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(searchAttendanceSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				WorkDTO wDAO = new WorkDTO();
				
				wDAO.setEmployeeCode(rs.getString(1)); //사원코드
				wDAO.setEmployeeName(rs.getString(2)); //사원명
				wDAO.setTotalWorkCount(rs.getInt(3)); //총 근무일수
				wDAO.setVacation(rs.getDouble(4)); //총 휴가
				wDAO.setLateness(rs.getInt(5)); //지각
				wDAO.setEarlyLeave(rs.getInt(6)); //조퇴
				wDAO.setAbsence(rs.getInt(7)); //결근
				allWorkInfo.add(wDAO);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return allWorkInfo;// 전사원 근태정보를 담은 리스트를 반환합니다.
	}
	
	
	public List<WorkDTO> getDetailAttendance(String employeeCode){
		ArrayList<WorkDTO> oneWorkInfo = new ArrayList<>();
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(searchDetailAttendanceSQL);
			pstmt.setString(1, employeeCode); // employeeCode를 설정
			rs = pstmt.executeQuery();
			while(rs.next()) {
				WorkDTO wdDAO = new WorkDTO();
				
				wdDAO.setEmployeeCode(rs.getString(1)); //사원코드
				wdDAO.setEmployeeName(rs.getString(2)); //사원명
				wdDAO.setTotalWorkCount(rs.getInt(3)); //총 근무일수
				wdDAO.setAttendanceCount(rs.getInt(4)); // 출근
				wdDAO.setBusinesstripCount(rs.getInt(5)); // 출장
				wdDAO.setOutsideWorkCount(rs.getInt(6)); //외근
				wdDAO.setVacation(rs.getDouble(7)); //총 휴가
				wdDAO.setMonthlyLeave(rs.getInt(8));// 월차 
				wdDAO.setHalfDayLeave(rs.getInt(9)); //반차
				wdDAO.setLateness(rs.getInt(10)); //지각 
				wdDAO.setEarlyLeave(rs.getInt(11)); //조퇴
				wdDAO.setAbsence(rs.getInt(12)); //결근 
				oneWorkInfo.add(wdDAO);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return oneWorkInfo;// 전사원 근태정보를 담은 리스트를 반환합니다.
	}
	
	/*
	 * // 해당 사원의 상세 근태 내역 public List<WorkDTO> getDetailAttendance(){ List<WorkDTO>
	 * detailWorkInfo = new ArrayList<>(); con = MyDBConnection.getConnection();
	 * 
	 * try { pstmt = con.prepareStatement(searchDetailAttendanceSQL);
	 * rs=pstmt.executeQuery();
	 * 
	 * WorkDTO wDAO = new WorkDTO();
	 * 
	 * wDAO.setEmployeeCode(rs.getString(1)); //사원코드
	 * wDAO.setEmployeeName(rs.getString(2)); //사원명
	 * wDAO.setTotalWorkCount(rs.getInt(3)); //총 근무일수
	 * wDAO.setAttendanceCount(rs.getInt(4)); // 출근
	 * wDAO.setBusinesstripCount(rs.getInt(5)); // 출장
	 * wDAO.setOutsideWorkCount(rs.getInt(6)); //외근
	 * wDAO.setVacation(rs.getDouble(7)); //총 휴가 wDAO.setMonthlyLeave(rs.getInt(8));
	 * // 월차 wDAO.setHalfDayLeave(rs.getInt(9)); //반차
	 * wDAO.setLateness(rs.getInt(10)); //지각 wDAO.setEarlyLeave(rs.getInt(11)); //조퇴
	 * wDAO.setAbsence(rs.getInt(12)); //결근 detailWorkInfo.add(wDAO);
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }finally {
	 * MyDBConnection.close(rs, pstmt, con); }
	 * 
	 * return detailWorkInfo; }
	 */
}


