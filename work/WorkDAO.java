package work;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dbconnection.MyDBConnection;

public class WorkDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null ;
	private ResultSet rs = null;
	
	// 전사원 근태 정보 가져오기
	private String searchAttendanceSQL = "select employeeCode, employeeName, totalWorkCount, vacation, lateness, earlyLeave, absence from totalattendance";  
	// 해당 사원 근태 상세 정보 가져오기
	private String searchDetailAttendanceSQL = "select * from totalattendance where employeeCode = ?";
	// 해당 사원 날짜별 데이터 가져오기
	private String totalDateofAttendanceSQL = "select date, startTimeForWork, endTimeForWork, status from attendance where employeeCode = ?";
	// 해당 사원의 근태 상태 수정하기
	private String updateStatusSQL = "update attendance set status=? where employeeCode=? and date=?";
	
	
	// 근태 상태 수정하기
	public void updateStatus() {
		
	}
	
	
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
			if(rs.next()) {
				WorkDTO wdDAO = new WorkDTO();
				
				wdDAO.setEmployeeCode(rs.getString("employeeCode")); //사원코드
				wdDAO.setEmployeeName(rs.getString("employeeName")); //사원명
				wdDAO.setTotalWorkCount(rs.getInt("totalWorkCount")); //총 근무일수
				wdDAO.setAttendanceCount(rs.getInt("attendanceCount")); // 출근
				wdDAO.setBusinesstripCount(rs.getInt("businesstripCount")); // 출장
				wdDAO.setOutsideWorkCount(rs.getInt("outsideWorkCount")); //외근
				wdDAO.setVacation(rs.getDouble("vacation")); //총 휴가
				wdDAO.setMonthlyLeave(rs.getInt("monthlyLeave"));// 월차 
				wdDAO.setHalfDayLeave(rs.getInt("halfDayLeave")); //반차
				wdDAO.setLateness(rs.getInt("lateness")); //지각 
				wdDAO.setEarlyLeave(rs.getInt("earlyLeave")); //조퇴
				wdDAO.setAbsence(rs.getInt("absence")); //결근 
				oneWorkInfo.add(wdDAO);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return oneWorkInfo;// 전사원 근태정보를 담은 리스트를 반환합니다.
	}
	
	// 전사원 근태 내역
		public List<WorkDTO> getAlldateofAttendance(String employeeCode){
			ArrayList<WorkDTO> workAllDateInfo = new ArrayList<>();
			con = MyDBConnection.getConnection();
			try {
				pstmt = con.prepareStatement(totalDateofAttendanceSQL);
				pstmt.setString(1, employeeCode); // employeeCode를 설정
				rs = pstmt.executeQuery();
				while(rs.next()) {
					WorkDTO wdtDAO = new WorkDTO();
					wdtDAO.setEmployeeCode(employeeCode); // 해당 사원코드
					wdtDAO.setDate(rs.getDate("date")); //날짜
					wdtDAO.setStartTimeForWork(rs.getTime("startTimeForWork")); //출근시간
					wdtDAO.setEndTimeForWork(rs.getTime("endTimeForWork")); //퇴근시간
					wdtDAO.setStatus(rs.getString("status")); //근태 상태
					workAllDateInfo.add(wdtDAO);
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
			
			return workAllDateInfo;// 해당 사원의 날짜별 근태정보를 담은 리스트를 반환합니다.
		}
		
		// "update attendance set status=? where employeeCode=? and date=?";
		public void startUpdateStatus(String employeeCode, Map<Date, String> statusMap ) {
			con = MyDBConnection.getConnection();
		    try {
		        pstmt = con.prepareStatement(updateStatusSQL);
		        pstmt.setString(2, employeeCode); // employeeCode를 설정합니다.
		        
	
		        // statusMap을 반복하여 PreparedStatement에 값을 설정합니다.
		        for (Map.Entry<Date, String> entry : statusMap.entrySet()) {
		            Date date = entry.getKey();
		            String status = entry.getValue();
		            
		            // 날짜와 상태 값을 PreparedStatement에 설정합니다.
		            pstmt.setString(1, status); // 첫 번째 파라미터에는 상태 값을 설정합니다.
		            pstmt.setDate(3, date); // 세 번째 파라미터에는 날짜 값을 설정합니다.
		            
		            // PreparedStatement를 실행합니다.
		            pstmt.executeUpdate();
		            System.out.println(date + status);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        // 리소스 해제 등 필요한 작업을 수행합니다.
		        MyDBConnection.close(rs, pstmt, con);
		    }
			
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


