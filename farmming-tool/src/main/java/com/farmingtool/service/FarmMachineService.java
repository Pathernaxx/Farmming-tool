package com.farmingtool.service;

import java.util.List;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.dto.Type;

public interface FarmMachineService {

	List<FarmMachine> getFarmMachineList();

	List<FarmMachine> searchMachineByLocation(String location2);
	
	FarmMachine getFarmMachineDetail(String fmno);

	List<FarmMachine> getFarmMachineAndTypeName();
	
	List<Type> getTypes();
	
	List<Type> getTypesByLocation(String location2);

}
