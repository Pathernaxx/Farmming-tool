package com.farmingtool.mapper;

import java.util.HashMap;
import java.util.List;

import com.farmingtool.dto.DetailMachine;
import com.farmingtool.dto.MemberEducation;
import com.farmingtool.dto.RentalHistory;

// 새로운 머신 삽입, 머신 가격 변경, 머신 폐기, 렌탈 내역 조회, 
// 렌탈 상태 변경, 회원 교육 이수 삽입, 회원 교육 이수 목록 출력
public interface AdminMachineSettingMapper {
	void 					insertDetailMachine(DetailMachine detailMachine);
	void 					updateDetailMachineCost(HashMap<String, Integer> params);
	void 					deleteDetailMachine(String machineNo);
	List<RentalHistory> 	selectRentalHistory(String locationName);
	void 					updateRentalHistoryStatus(HashMap<String, Integer> params);
	void 					insertMemberEducation(MemberEducation memberEducation);
	List<MemberEducation>	selectMemberEducationById(String memberId);
}
