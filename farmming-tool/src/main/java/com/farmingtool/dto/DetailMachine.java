package com.farmingtool.dto;

import java.util.List;

public class DetailMachine {
	private String machineNo;
	private String fmNo;
	private String machineName;
	private String machineInformation;
	private int machineRentalCost;
	private int machineStatus;
	private int locationNo2;
	
	//사용 가능한 기계번호 리스트
	private List<String> rentableMachines;
	
	public String getMachineNo() {
		return machineNo;
	}
	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}
	public String getFmNo() {
		return fmNo;
	}
	public void setFmNo(String fmNo) {
		this.fmNo = fmNo;
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
	public int getMachineStatus() {
		return machineStatus;
	}
	public void setMachineStatus(int machineStatus) {
		this.machineStatus = machineStatus;
	}
	public int getLocationNo2() {
		return locationNo2;
	}
	public void setLocationNo2(int locationNo2) {
		this.locationNo2 = locationNo2;
	}
	public List<String> getRentableMachines() {
		return rentableMachines;
	}
	public void setRentableMachines(List<String> rentableMachines) {
		this.rentableMachines = rentableMachines;
	}
	
}
