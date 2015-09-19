package com.farmingtool.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.dto.FarmMachine;
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
	
	



}
