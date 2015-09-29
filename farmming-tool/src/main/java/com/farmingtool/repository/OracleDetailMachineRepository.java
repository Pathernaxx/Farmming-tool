package com.farmingtool.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.farmingtool.dto.Location2;
import com.farmingtool.dto.RentalInfomation;
//github.com/Pathernaxx/Farmming-tool.git
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
	public List<String> countRentableMachine(Date historyRentalDate, String fmNo, String locationNo2) {
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("historyRentalDate", historyRentalDate);
		params.put("fmNo", fmNo);
		params.put("locationNo2", locationNo2);
		
		return detailMachineMapper.countRentableMachine(params);
		
	}

	@Override
	public int countDetailMachine(String fmNo, int locationNo2) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("fmNo", fmNo);
		params.put("locationNo2", locationNo2);
		
		return detailMachineMapper.countDetailMachine(params);
	}

	@Override
	public List<Location2> searchLocation2(String location1) {
		List<Location2> location2s = detailMachineMapper.searchLocation2(location1);
		return location2s;
	}
	
	@Override
	public RentalInfomation rentalCheck(String machineNo, int historyNo) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("machineNo", machineNo);
		params.put("historyNo", historyNo);
		
		return detailMachineMapper.rentalCheck(params);
	}

	@Override
	public int rentalMachineCount(HashMap<String, Object> params) {
		int rentalCount = detailMachineMapper.rentalMachineCount(params);
		return rentalCount;
	}

	@Override
	public int rentalMachineCountByDate(HashMap<String, Object> params) {
		int count = detailMachineMapper.rentalMachineCountByDate(params);
		return count;
	}

	@Override
	public int rentalMachineCost(HashMap<String, Object> params) {
		int rentalCost = detailMachineMapper.rentalMachineCost(params);
		return rentalCost;
	}
	
	
	
}
