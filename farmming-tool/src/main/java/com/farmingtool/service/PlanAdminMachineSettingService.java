package com.farmingtool.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.dto.DetailMachine;
import com.farmingtool.dto.MemberEducation;
import com.farmingtool.dto.RentalHistory;
import com.farmingtool.repository.AdminMachineSettingRepository;

@Service(value="adminMachineSettingService")
public class PlanAdminMachineSettingService implements AdminMachineSettingService {

	private AdminMachineSettingRepository adminMachineSettingRepository;
	
	@Autowired
	@Qualifier(value="adminMachineSettingRepository")
	public void setAdminMachineSettingRepository(AdminMachineSettingRepository adminMachineSettingRepository)
	{
		this.adminMachineSettingRepository = adminMachineSettingRepository;
	}
	
	@Override
	public void setDetailMachine(DetailMachine detailMachine) {
		// TODO Auto-generated method stub
		adminMachineSettingRepository.insertDetailMachine(detailMachine);
	}

	@Override
	public void setDetailMachineCost(int rentalCost, int machineNo) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		params.put("retalCost", rentalCost);
		params.put("machineNo", machineNo);
		
		adminMachineSettingRepository.updateDetailMachineCost(params);
	}

	@Override
	public void removeDetailMachine(String machineNo) {
		// TODO Auto-generated method stub
		adminMachineSettingRepository.deleteDetailMachine(machineNo);
	}

	@Override
	public List<RentalHistory> getRentalHistory(String locationName) {
		// TODO Auto-generated method stub
		return adminMachineSettingRepository.selectRentalHistory(locationName);
	}

	@Override
	public void setRentalHistoryStatus(int status, int historyNo) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		params.put("status", status);
		params.put("historyNo", historyNo);
		
		adminMachineSettingRepository.updateRentalHistoryStatus(params);
	}

	@Override
	public void setMemberEducation(MemberEducation memberEducation) {
		// TODO Auto-generated method stub
		adminMachineSettingRepository.insertMemberEducation(memberEducation);
	}

	@Override
	public List<MemberEducation> getMemberEducationById(String memberId) {
		// TODO Auto-generated method stub
		return adminMachineSettingRepository.selectMemberEducationById(memberId);
	}

	
}
