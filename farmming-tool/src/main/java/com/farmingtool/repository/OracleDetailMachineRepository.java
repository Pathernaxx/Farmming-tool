package com.farmingtool.repository;

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
	
	
	
}
