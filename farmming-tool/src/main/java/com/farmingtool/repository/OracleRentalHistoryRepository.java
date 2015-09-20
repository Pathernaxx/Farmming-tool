package com.farmingtool.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.farmingtool.dto.RentalHistory;
import com.farmingtool.mapper.RentalHistoryMapper;

@Repository(value="rentalHistoryRepository")
public class OracleRentalHistoryRepository implements RentalHistoryRepository{

	private RentalHistoryMapper rentalHistoryMapper;
	
	@Autowired
	@Qualifier(value="rentalHistoryMapper")
	public void setRentalHistoryMapper(RentalHistoryMapper rentalHistoryMapper) {
		this.rentalHistoryMapper = rentalHistoryMapper;
	}
	
	@Override
	public void insertRentalHistory(RentalHistory history) {

		rentalHistoryMapper.insertRentalHistory(history);
		
	}
	
	
}
