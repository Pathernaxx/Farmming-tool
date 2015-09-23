package com.farmingtool.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.farmingtool.dto.RentalInfomation;

import com.farmingtool.dto.Location2;

public interface DetailMachineRepository {

	void updateDetailMachineStatus(String machineNo);
	List<String> countRentableMachine(Date historyRentalDate,String fmNo, int locationNo2);
	int countDetailMachine(String fmNo, int locationNo2);
	List<Location2> searchLocation2(String location1);
	RentalInfomation rentalCheck(String machineNo, int historyNo);
	int rentalMachineCount(HashMap<String, Object> params);
	HashMap<Date, String> rentalMachineCountByDate(HashMap<String, Object> params);
}
