package com.farmingtool.repository;

import java.util.Date;

public interface DetailMachineRepository {

	void updateDetailMachineStatus(String machineNo);
	int countRentableMachine(String historyRentalDate,String fmNo);
	
}
