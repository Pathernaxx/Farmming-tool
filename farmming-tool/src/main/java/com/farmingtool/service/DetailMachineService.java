package com.farmingtool.service;

import java.util.Date;
import java.util.List;

public interface DetailMachineService {

	void updateDetailMachineStatus(String machineNo);
	List<String> countRentableMachine(Date historyRentalDate,String fmNo);
	int countDetailMachine(String fmNo);
	

}
