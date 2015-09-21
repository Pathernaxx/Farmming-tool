package com.farmingtool.service;

import java.util.Date;
import java.util.List;

import com.farmingtool.dto.Location2;
import com.farmingtool.dto.Type;

public interface DetailMachineService {

	void updateDetailMachineStatus(String machineNo);
	List<String> countRentableMachine(Date historyRentalDate,String fmNo);
	int countDetailMachine(String fmNo, int locationNo2);
	List<Location2> searchLocation2(String location1);
}
