package com.farmingtool.dto;

import java.util.Date;

public class RentalHistory {
	private int historyNo;
	private int machineNo;
	private String memberId;
	private Date historyRentalDate;
	private Date historyReturnDate;
	private Date historyStatus;
	
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public int getMachineNo() {
		return machineNo;
	}
	public void setMachineNo(int machineNo) {
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
	public Date getHistoryStatus() {
		return historyStatus;
	}
	public void setHistoryStatus(Date historyStatus) {
		this.historyStatus = historyStatus;
	}
	
}
