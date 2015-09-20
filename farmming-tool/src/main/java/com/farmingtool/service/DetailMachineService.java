package com.farmingtool.service;

public interface DetailMachineService {

	void updateDetailMachineStatus(String machineNo);
	int countRentableMachine(String historyRentalDate,String fmNo);

}
