package com.farmingtool.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.farmingtool.mapper.DetailMachineMapper;

@Repository(value="detailMachineRepository")
public class OracleDetailMachineRepository implements DetailMachineRepository{
	
	private DetailMachineMapper detailMachineMapper;
	@Autowired
	@Qualifier("detailMachineMapper")
	public void setDetailMachineMapper(DetailMachineMapper detailMachineMapper) {
		this.detailMachineMapper = detailMachineMapper;
	}
	
	@Override
	public void updateDetailMachineStatus(String machineNo) {
		detailMachineMapper.updateDetailMachineStatus(machineNo);
		
	}

	@Override
	public List<String> countRentableMachine(Date historyRentalDate,String fmNo) {
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("historyRentalDate", historyRentalDate);
		params.put("fmNo", fmNo);
		
		return detailMachineMapper.countRentableMachine(params);
		
	}

	@Override
	public int countDetailMachine(String fmNo, int locationNo2) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("fmNo", fmNo);
		params.put("locationNo2", locationNo2);
		
		return detailMachineMapper.countDetailMachine(params);
	}
	
	
	
}
