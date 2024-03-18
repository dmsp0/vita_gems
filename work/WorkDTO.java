package work;

import java.sql.Date;
import java.sql.Time;

public class WorkDTO {

	// TABLE totalattendance
private String employeeCode; // 사원코드
private String employeeName; //사원명
private int totalWorkCount; //총 근무일
private int attendanceCount; // 출근일
private int businesstripCount; // 출장
private int outsideWorkCount; //외근
private double vacation; //휴가
private int monthlyLeave; // 월차
private int halfDayLeave; //반차
private int lateness; //지각
private int earlyLeave; //조퇴
private int absence; //결근
	// TABLE attendance
private Date date; // 날짜
private Time startTimeForWork; // 출근시간
private Time endTimeForWork; // 퇴근시간
private String status; // 근태 상태



public String getEmployeeCode() {
	return employeeCode;
}
public void setEmployeeCode(String employeeCode) {
	this.employeeCode = employeeCode;
}
public String getEmployeeName() {
	return employeeName;
}
public void setEmployeeName(String employeeName) {
	this.employeeName = employeeName;
}
public int getTotalWorkCount() {
	return totalWorkCount;
}
public void setTotalWorkCount(int totalWorkCount) {
	this.totalWorkCount = totalWorkCount;
}
public int getAttendanceCount() {
	return attendanceCount;
}
public void setAttendanceCount(int attendanceCount) {
	this.attendanceCount = attendanceCount;
}
public int getBusinesstripCount() {
	return businesstripCount;
}
public void setBusinesstripCount(int businesstripCount) {
	this.businesstripCount = businesstripCount;
}
public int getOutsideWorkCount() {
	return outsideWorkCount;
}
public void setOutsideWorkCount(int outsideWorkCount) {
	this.outsideWorkCount = outsideWorkCount;
}
public double getVacation() {
	return vacation;
}
public void setVacation(double vacation) {
	this.vacation = vacation;
}
public int getMonthlyLeave() {
	return monthlyLeave;
}
public void setMonthlyLeave(int monthlyLeave) {
	this.monthlyLeave = monthlyLeave;
}
public int getHalfDayLeave() {
	return halfDayLeave;
}
public void setHalfDayLeave(int halfDayLeave) {
	this.halfDayLeave = halfDayLeave;
}
public int getLateness() {
	return lateness;
}
public void setLateness(int lateness) {
	this.lateness = lateness;
}
public int getEarlyLeave() {
	return earlyLeave;
}
public void setEarlyLeave(int earlyLeave) {
	this.earlyLeave = earlyLeave;
}
public int getAbsence() {
	return absence;
}
public void setAbsence(int absence) {
	this.absence = absence;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

public Time getStartTimeForWork() {
	return startTimeForWork;
}
public void setStartTimeForWork(Time startTimeForWork) {
	this.startTimeForWork = startTimeForWork;
}
public Time getEndTimeForWork() {
	return endTimeForWork;
}
public void setEndTimeForWork(Time endTimeForWork) {
	this.endTimeForWork = endTimeForWork;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}


}
