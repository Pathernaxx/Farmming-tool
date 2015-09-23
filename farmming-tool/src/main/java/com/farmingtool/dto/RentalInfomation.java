package com.farmingtool.dto;

import java.util.Date;

public class RentalInfomation {
	private String machineName;
	private String machineInformation;
	private int machineRentalCost;
	private int locationNo2;
	private String machineNo;
	private String memberId;
	private Date historyRentalDate;
	private Date historyReturnDate;
	
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
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}
	public String getMachineInformation() {
		return machineInformation;
	}
	public void setMachineInformation(String machineInformation) {
		this.machineInformation = machineInformation;
	}
	public int getMachineRentalCost() {
		return machineRentalCost;
	}
	public void setMachineRentalCost(int machineRentalCost) {
		this.machineRentalCost = machineRentalCost;
	}
	public int getLocationNo2() {
		return locationNo2;
	}
	public void setLocationNo2(int locationNo2) {
		this.locationNo2 = locationNo2;
	}
	
}
