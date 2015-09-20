package com.farmingtool.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.repository.DetailMachineRepository;



@Service("detailMachineService")
public class PlanDetailMachineService implements DetailMachineService{

	private DetailMachineRepository detailMachineRepository;
	@Autowired
	@Qualifier("detailMachineRepository")
	public void setDetailMachineRepository(DetailMachineRepository detailMachineRepository) {
		this.detailMachineRepository = detailMachineRepository;
	}
	
	@Override
	public void updateDetailMachineStatus(String machineNo) {
		
		detailMachineRepository.updateDetailMachineStatus(machineNo);
		
	}

	@Override
	public List<String> countRentableMachine(Date historyRentalDate,String fmNo) {

		return detailMachineRepository.countRentableMachine(historyRentalDate, fmNo);
		
	}

	@Override
	public int countDetailMachine(String fmNo) {
		return detailMachineRepository.countDetailMachine(fmNo);
	}



}
