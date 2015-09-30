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
	
	////////////결과창에서 보여주기 위한 필드///////////////////
	private String memberName;
	private String historyRentalDateToString;
	private String historyReturnDateToString;
	private String locationNo2Name;
	
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
	
	public String getLocationNo2Name() {
		return locationNo2Name;
	}
	public void setLocationNo2Name(String locationNo2Name) {
		this.locationNo2Name = locationNo2Name;
	}
	////////////////////////////////////////////////
	
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
