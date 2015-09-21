package com.farmingtool.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.dto.Type;
import com.farmingtool.mapper.FarmMachineMapper;

@Repository(value="farmMachineRepository")
public class OracleFarmMachineRepository implements FarmMachineRepository{
	
	private FarmMachineMapper farmMachineMapper;
	@Autowired
	@Qualifier("farmMachineMapper")
	public void setFarmMachineMapper(FarmMachineMapper farmMachineMapper) {
		this.farmMachineMapper = farmMachineMapper;
	}
	
	
	@Override
	public List<FarmMachine> getFarmMachineList() {
		// TODO Auto-generated method stub
		return farmMachineMapper.getFarmMachineList();
	}


	@Override
	public FarmMachine getFarmMachineDetail(String fmno) {
		// TODO Auto-generated method stub
		return farmMachineMapper.getFarmMachineDetail(fmno);
	}


	@Override
	public List<FarmMachine> getFarmMachineAndTypeName() {
		List<FarmMachine> farmMachineList = farmMachineMapper.getFarmMachineAndTypeName();
		return farmMachineList;
	}


	@Override
	public List<Type> getTypes() {
		List<Type> types = farmMachineMapper.getTypes();
		return types;
	}


	@Override
	public List<FarmMachine> searchMachineByLocation(String location2) {
		List<FarmMachine> farmMachineListByLocation = 
				farmMachineMapper.searchMachineByLocation(location2);
		return farmMachineListByLocation;
	}

	@Override
	public List<Type> getTypesByLocation(String location2) {
		List<Type> types = farmMachineMapper.getTypesByLocation(location2);
		return types;
	}
	
	
	
	
}
