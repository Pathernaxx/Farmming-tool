package com.farmingtool.repository;

import java.util.HashMap;
import java.util.List;

import com.farmingtool.dto.DetailMachine;
import com.farmingtool.dto.MemberEducation;
import com.farmingtool.dto.RentalHistory;

public interface AdminMachineSettingRepository {
	void 					insertDetailMachine(DetailMachine detailMachine);
	void 					updateDetailMachineCost(HashMap<String, String> params);
	void 					deleteDetailMachine(String machineNo);
	List<RentalHistory> 	selectRentalHistory(String locationName);
	void 					updateRentalHistoryStatus(HashMap<String, String> params);
	void 					insertMemberEducation(MemberEducation memberEducation);
	List<MemberEducation>	selectMemberEducationById(String memberId);
}
