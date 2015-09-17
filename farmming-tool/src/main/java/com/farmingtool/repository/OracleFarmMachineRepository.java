package com.farmingtool.repository;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.mapper.FarmMachineMapper;

@Repository(value="farmMachineRepository")
public class OracleFarmMachineRepository implements FarmMachineRepository{
	
	private FarmMachineMapper farmMachineMapper;
	@Autowired
	@Qualifier("farmMachineMapper")
	public void setFarmMachineMapper(FarmMachineMapper farmMachineMapper) {
		this.farmMachineMapper = farmMachineMapper;
	}
	
	
	@Override
	public List<FarmMachine> getFarmMachineList() {
		// TODO Auto-generated method stub
		return farmMachineMapper.getFarmMachineList();
	}
	
	
	
	
}
