package com.farmingtool.mapper;

import java.util.HashMap;
import java.util.List;

import com.farmingtool.dto.Location2;
import com.farmingtool.dto.RentalInfomation;

public interface DetailMachineMapper {

	void updateDetailMachineStatus(String machineNo);
	List<String> countRentableMachine(HashMap<Object, Object> params);
	int countDetailMachine(HashMap<String, Object> params);
	List<Location2> searchLocation2(String location1);
	RentalInfomation rentalCheck(HashMap<String, Object> params);
}
