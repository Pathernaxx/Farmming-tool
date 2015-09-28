package com.farmingtool.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.farmingtool.dto.DetailMachine;
import com.farmingtool.dto.MemberEducation;
import com.farmingtool.dto.RentalHistory;
import com.farmingtool.mapper.AdminMachineSettingMapper;

@Repository(value="adminMachineSettingRepository")
public class OracleAdminMachineSettingRepository implements AdminMachineSettingRepository{

	private AdminMachineSettingMapper adminMachineSettingMapper;
	
	@Autowired
	@Qualifier(value="adminMachineSettingMapper")
	public void setAdminMachineSettingMapper(AdminMachineSettingMapper adminMachineSettingMapper)
	{
		this.adminMachineSettingMapper = adminMachineSettingMapper;
	}
	
	@Override
	public void insertDetailMachine(DetailMachine detailMachine) {
		// TODO Auto-generated method stub
		adminMachineSettingMapper.insertDetailMachine(detailMachine);
	}

	@Override
	public void updateDetailMachineCost(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		adminMachineSettingMapper.updateDetailMachineCost(params);
	}

	@Override
	public void deleteDetailMachine(String machineNo) {
		// TODO Auto-generated method stub
		adminMachineSettingMapper.deleteDetailMachine(machineNo);
	}

	@Override
	public List<RentalHistory> selectRentalHistory(String locationName) {
		// TODO Auto-generated method stub
		return adminMachineSettingMapper.selectRentalHistory(locationName);
	}

	@Override
	public void updateRentalHistoryStatus(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		adminMachineSettingMapper.updateRentalHistoryStatus(params);
	}

	@Override
	public void insertMemberEducation(MemberEducation memberEducation) {
		// TODO Auto-generated method stub
		adminMachineSettingMapper.insertMemberEducation(memberEducation);
	}

	@Override
	public List<MemberEducation> selectMemberEducationById(String memberId) {
		// TODO Auto-generated method stub
		return adminMachineSettingMapper.selectMemberEducationById(memberId);
	}

}
