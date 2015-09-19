package com.farmingtool.mapper;

import java.util.HashMap;

public interface DetailMachineMapper {

	void updateDetailMachineStatus(String machineNo);
	int countRentableMachine(HashMap<String, String> params);
	
}
