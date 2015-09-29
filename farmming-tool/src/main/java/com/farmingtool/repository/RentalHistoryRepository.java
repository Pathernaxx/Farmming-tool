package com.farmingtool.repository;

import java.util.List;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.dto.RentalHistory;

public interface RentalHistoryRepository {
	int insertRentalHistory(RentalHistory history);
}
