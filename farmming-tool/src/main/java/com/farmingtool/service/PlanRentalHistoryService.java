package com.farmingtool.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.repository.RentalHistoryRepository;

@Service(value="rentalHistoryService")
public class PlanRentalHistoryService implements RentalHistoryService {

	private RentalHistoryRepository rentalHistoryRepository;

	@Autowired
	@Qualifier(value="rentalHistoryRepository")
	public void setRentalHistoryRepository(RentalHistoryRepository rentalHistoryRepository) {
		this.rentalHistoryRepository = rentalHistoryRepository;
	}
	
}
