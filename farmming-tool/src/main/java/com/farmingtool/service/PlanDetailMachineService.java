package com.farmingtool.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.dto.Location2;
import com.farmingtool.dto.RentalInfomation;
//github.com/Pathernaxx/Farmming-tool.git
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
	public List<String> countRentableMachine(Date historyRentalDate,String fmNo,int locationNo2) {

		return detailMachineRepository.countRentableMachine(historyRentalDate, fmNo, locationNo2);
		
	}

	@Override
	public int countDetailMachine(String fmNo, int locationNo2) {
		return detailMachineRepository.countDetailMachine(fmNo, locationNo2);
	}

	@Override
	public List<Location2> searchLocation2(String location1) {
		List<Location2> location2s = detailMachineRepository.searchLocation2(location1);
		return location2s;
	}
		
	@Override
	public RentalInfomation rentalCheck(String machineNo, int historyNo) {
		return detailMachineRepository.rentalCheck(machineNo, historyNo);
	}



}
