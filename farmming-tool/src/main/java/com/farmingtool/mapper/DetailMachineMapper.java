package com.farmingtool.mapper;

import java.util.HashMap;
import java.util.List;

public interface DetailMachineMapper {

	void updateDetailMachineStatus(String machineNo);
	List<String> countRentableMachine(HashMap<Object, Object> params);
	int countDetailMachine(HashMap<String, Object> params);
	
}
