package com.farmingtool.dto;

import java.util.Date;

public class RentalHistory {
	private int historyNo;
	private String machineNo;
	private String memberId;
	private String historyRentalDate;
	private String historyReturnDate;
	private int historyStatus;
	
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
	public String getHistoryRentalDate() {
		return historyRentalDate;
	}
	public void setHistoryRentalDate(String historyRentalDate) {
		this.historyRentalDate = historyRentalDate;
	}
	public String getHistoryReturnDate() {
		return historyReturnDate;
	}
	public void setHistoryReturnDate(String historyReturnDate) {
		this.historyReturnDate = historyReturnDate;
	}
	public int getHistoryStatus() {
		return historyStatus;
	}
	public void setHistoryStatus(int historyStatus) {
		this.historyStatus = historyStatus;
	}
	
	
}
