package com.farmingtool.repository;

import java.util.Date;
import java.util.List;

public interface DetailMachineRepository {

	void updateDetailMachineStatus(String machineNo);
	List<String> countRentableMachine(Date historyRentalDate,String fmNo);
	int countDetailMachine(String fmNo, int locationNo2);
	
}
