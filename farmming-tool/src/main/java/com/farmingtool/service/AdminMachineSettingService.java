package com.farmingtool.service;

import java.util.HashMap;
import java.util.List;

import com.farmingtool.dto.DetailMachine;
import com.farmingtool.dto.MemberEducation;
import com.farmingtool.dto.RentalHistory;

public interface AdminMachineSettingService {
	void 					setDetailMachine(DetailMachine detailMachine);
	void 					setDetailMachineCost(int rentalCost, int machineNo);
	void 					removeDetailMachine(String machineNo);
	List<RentalHistory> 	getRentalHistory(String locationName);
	void 					setRentalHistoryStatus(int status, int historyNo);
	void 					setMemberEducation(MemberEducation memberEducation);
	List<MemberEducation>	getMemberEducationById(String memberId);
}
