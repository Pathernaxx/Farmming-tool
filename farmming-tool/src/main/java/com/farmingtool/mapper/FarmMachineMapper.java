package com.farmingtool.mapper;

import java.util.List;

import com.farmingtool.dto.FarmMachine;

public interface FarmMachineMapper {

	List<FarmMachine> getFarmMachineList();

	FarmMachine getFarmMachineDetail(String fmno);

}
