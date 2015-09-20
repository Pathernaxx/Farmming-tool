package com.farmingtool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.dto.Type;
import com.farmingtool.repository.FarmMachineRepository;



@Service("farmMachineService")
public class PlanFarmMachineService implements FarmMachineService{

	private FarmMachineRepository farmMachineRepository;
	@Autowired
	@Qualifier("farmMachineRepository")
	public void setFarmMachineRepository(FarmMachineRepository farmMachineRepository) {
		this.farmMachineRepository = farmMachineRepository;
	}
	
	
	@Override
	public List<FarmMachine> getFarmMachineList() {
		// TODO Auto-generated method stub
		return farmMachineRepository.getFarmMachineList();
	}


	@Override
	public FarmMachine getFarmMachineDetail(String fmno) {
		// TODO Auto-generated method stub
		return farmMachineRepository.getFarmMachineDetail(fmno);
	}


	@Override
	public List<FarmMachine> getFarmMachineAndTypeName() {
		List<FarmMachine> farmMachineList = farmMachineRepository.getFarmMachineAndTypeName();
		return farmMachineList;
	}


	@Override
	public List<Type> getTypes() {
		List<Type> types = farmMachineRepository.getTypes();
		return types;
	}


	@Override
	public List<FarmMachine> searchMachineByLocation(String location2) {
		List<FarmMachine> farmMachineListByLocation = 
				farmMachineRepository.searchMachineByLocation(location2);
		return farmMachineListByLocation;
	}
	
	



}
