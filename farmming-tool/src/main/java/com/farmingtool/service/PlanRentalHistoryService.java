package com.farmingtool.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.dto.RentalHistory;
import com.farmingtool.repository.RentalHistoryRepository;

@Service(value="rentalHistoryService")
public class PlanRentalHistoryService implements RentalHistoryService {

	private RentalHistoryRepository rentalHistoryRepository;

	@Autowired
	@Qualifier(value="rentalHistoryRepository")
	public void setRentalHistoryRepository(RentalHistoryRepository rentalHistoryRepository) {
		this.rentalHistoryRepository = rentalHistoryRepository;
	}

	@Override
	public int insertRentalHistory(RentalHistory history) {
		int historyNo = rentalHistoryRepository.insertRentalHistory(history);
		return historyNo;
	}

	
}
