package com.farmingtool.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository(value="rentalHistoryRepository")
public class OracleRentalHistoryRepository implements RentalHistoryRepository{

	private RentalHistoryRepository rentalHistoryMapper;
	
	@Autowired
	@Qualifier(value="retalHistoryMapper")
	public void setRentalHistoryMapper(RentalHistoryRepository rentalHistoryMapper) {
		this.rentalHistoryMapper = rentalHistoryMapper;
	}
	
	
}
