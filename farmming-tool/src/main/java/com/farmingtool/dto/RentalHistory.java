package com.farmingtool.dto;

import java.util.Date;

public class RentalHistory {
	private int historyNo;
	private String machineNo;
	private String memberId;
	private Date historyRentalDate;
	private Date historyReturnDate;
	private int historyStatus;

	////////////결과창에서 보여주기 위한 필드///////////////////
	private String machineName;
	private String memberName;
	private String historyRentalDateToString;
	private String historyReturnDateToString;
	
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getHistoryRentalDateToString() {
		return historyRentalDateToString;
	}
	public void setHistoryRentalDateToString(String historyRentalDateToString) {
		this.historyRentalDateToString = historyRentalDateToString;
	}
	public String getHistoryReturnDateToString() {
		return historyReturnDateToString;
	}
	public void setHistoryReturnDateToString(String historyReturnDateToString) {
		this.historyReturnDateToString = historyReturnDateToString;
	}
	////////////////////////////////////////////////
	
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public String getMachineNo() {
		return machineNo;
	}
	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getHistoryRentalDate() {
		return historyRentalDate;
	}
	public void setHistoryRentalDate(Date historyRentalDate) {
		this.historyRentalDate = historyRentalDate;
	}
	public Date getHistoryReturnDate() {
		return historyReturnDate;
	}
	public void setHistoryReturnDate(Date historyReturnDate) {
		this.historyReturnDate = historyReturnDate;
	}
	public int getHistoryStatus() {
		return historyStatus;
	}
	public void setHistoryStatus(int historyStatus) {
		this.historyStatus = historyStatus;
	}
	
	
}
