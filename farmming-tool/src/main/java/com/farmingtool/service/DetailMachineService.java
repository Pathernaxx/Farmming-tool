package com.farmingtool.service;

import java.util.Date;
import java.util.List;

import com.farmingtool.dto.RentalInfomation;

public interface DetailMachineService {

	void updateDetailMachineStatus(String machineNo);
	List<String> countRentableMachine(Date historyRentalDate,String fmNo,int locationNo2);
	int countDetailMachine(String fmNo, int locationNo2);
	RentalInfomation rentalCheck(String machineNo, int historyNo);

}
