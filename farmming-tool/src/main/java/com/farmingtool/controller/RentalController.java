package com.farmingtool.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.dto.Location2;
import com.farmingtool.dto.Member;
import com.farmingtool.dto.RentalHistory;
import com.farmingtool.dto.RentalInfomation;
import com.farmingtool.dto.Type;
import com.farmingtool.service.DetailMachineService;
import com.farmingtool.service.FarmMachineService;
import com.farmingtool.service.RentalHistoryService;

@Controller
@RequestMapping(value="rental")
public class RentalController {
	
	private DetailMachineService detailMachineService;
	private RentalHistoryService rentalHistoryService;
	private FarmMachineService farmMachineService;
	
	@Autowired
	@Qualifier("detailMachineService")
	public void setDetailMachineService(DetailMachineService detailMachineService) {
		this.detailMachineService = detailMachineService;
	}
	
	@Autowired
	@Qualifier("rentalHistoryService")
	public void setRentalHistoryService(RentalHistoryService rentalHistoryService) {
		this.rentalHistoryService = rentalHistoryService;
	}
	
	@Autowired
	@Qualifier("farmMachineService")
	public void setFarmMachineService(FarmMachineService farmMachineService) {
		this.farmMachineService = farmMachineService;
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping(value="rentalmain.action", method=RequestMethod.GET)
	public String rentalView() {
		return "rental/rentalmain";
	}
	
	/*@RequestMapping(value="rentalCheck.action", method=RequestMethod.GET)
	public ModelAndView rentalCheck() {
		
		ModelAndView mav = new ModelAndView();
		
		List<Type> types = farmMachineService.getTypes();
		List<FarmMachine> farmMachineList = farmMachineService.getFarmMachineAndTypeName();
		
		mav.addObject("types", types);
		mav.addObject("farmMachineList", farmMachineList);
		mav.setViewName("rental/rentalcheck");
		
		return mav;
	}*/
	
	@RequestMapping(value="calendarTest.action", method=RequestMethod.GET)
	public String calendarTest() {
		return "rental/calendartest";
	}
	
	
	
	
	@RequestMapping(value="resultCalendar.action", method=RequestMethod.GET)
	@ResponseBody
	public int resultCalendar(HttpServletRequest request) {
		String fmNo = request.getParameter("fmNo");
		int locationNo2 = Integer.parseInt(request.getParameter("locationNo2"));
		//System.out.println(fmNo+'/'+locationNo2);
		
		//전체 보유 대수
		int countDetailMachine = detailMachineService.countDetailMachine(fmNo, locationNo2);
		
		//대여 가능 대수
		//List<String> rentableMachines = detailMachineService.countRentableMachine(historyRentalDate, fmNo) 
		//int rentableMachineCount = rentableMachines.size();
		
		return countDetailMachine;
		
	}
	
	
	@RequestMapping(value="rentalMachine.action", method=RequestMethod.POST)
	@ResponseBody
	public String rentalMachine(HttpServletRequest request, HttpSession session) throws ParseException {
		
		String memberId = ((Member)session.getAttribute("loginuser")).getMemberId();
		int statusNo = 1;
		String locationNo2 = request.getParameter("locationNo2");
		
		/* 예약처리는 여기서 페이지 이동은 jsp ajax에서 */
		String rentalDate = request.getParameter("rentalDate");
		String machineNo= null;//request.getParameter("machineNo");
		String fmNo = request.getParameter("fmNo");
		
		String result = null;
		
		try {
			//대여일 date 형식으로 변환
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date rentalDate2 = format.parse(rentalDate);
			
			//반납일 설정 (대여일 + 1)
			Calendar c = Calendar.getInstance(); 
			c.setTime(rentalDate2); 
			c.add(Calendar.DATE, 1);
			Date returnDate = c.getTime();

			//날짜 String -> date 확인 코드
//			SimpleDateFormat format1 = new SimpleDateFormat("yyyy년MM월dd일");
//			String dateString = format1.format(returnDate);
//			System.out.println(dateString);
			
			//System.out.println(fmNo+'/'+rentalDate2);
			
			List<String> rentableMachines = detailMachineService.countRentableMachine(rentalDate2, fmNo, locationNo2);
			
			if (rentableMachines.size() > 0) {
				/* 해당날짜에 가능한 대여기계 있을 때 랜덤하게 하나 선택해서 예약 아래 수행  */
				machineNo = rentableMachines.get(0);
				
				RentalHistory history = new RentalHistory();
				history.setMemberId(memberId); //session
				history.setHistoryRentalDate(rentalDate2); //rentalDate
				history.setHistoryReturnDate(returnDate); //rentalDate + 1
				history.setHistoryStatus(statusNo); //0반납 1대여중
				history.setMachineNo(machineNo); //select 결과
				
				rentalHistoryService.insertRentalHistory(history);
				//detailMachineService.updateDetailMachineStatus(machineNo);
				result = machineNo+"&historyNo="+history.getHistoryNo();
			} else {
				/* 대여 가능한 기게가 없을 경우 */
				result = null;
			}
			
		} catch (java.text.ParseException ex) {
			ex.printStackTrace();
		}
		
		return result;
	}
	
	//예약 확인창으로 이동
	@RequestMapping(value="moveToCheckRental.action", method=RequestMethod.GET)
	public ModelAndView moveToCheckRental(HttpSession session, String machineNo, int historyNo) {
		
		//String memberId = ((Member)session.getAttribute("loginuser")).getMemberId();
		RentalInfomation info = detailMachineService.rentalCheck(machineNo, historyNo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", info);
		mav.setViewName("rental/rentalcheckpage");
		
		return mav;
	}
	
	@RequestMapping(value="searchlocation2.action", method=RequestMethod.POST)
	public ModelAndView searchLocation2(String location1) {
		ModelAndView mav = new ModelAndView();
		List<Location2> location2s = detailMachineService.searchLocation2(location1);
		
		mav.addObject("location2s", location2s);
		mav.setViewName("rental/location2list");
		return mav;
	}
	
	@RequestMapping(value="searchmachinebylocation.action", method=RequestMethod.POST)
	public ModelAndView searchMachineByLocation(String location2) {
		ModelAndView mav = new ModelAndView();
		
		List<Type> types = farmMachineService.getTypesByLocation(location2);
		List<FarmMachine> farmMachineListByLocation = 
				farmMachineService.searchMachineByLocation(location2);
		
		mav.addObject("types", types);
		mav.addObject("farmMachineList", farmMachineListByLocation);
		mav.setViewName("rental/newfarmmachinelist");
		return mav;
	}
	
	
	@RequestMapping(value="searchmachinecount.action", method=RequestMethod.POST)
	@ResponseBody
	public String searchMachinecount(String location2, String fmNo) {
		int locationNo2 = Integer.parseInt(location2);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("locationNo2", locationNo2);
		params.put("fmNo", fmNo);
		
		//detailMachine에서 fm_no를통해(FA010000) 해당 머신을 모두 가져온다.
		// status 0 : 대여가능,	 1 : 대여불가능
		int rentalCount = detailMachineService.rentalMachineCount(params);
		int rentalCost = detailMachineService.rentalMachineCost(params);
		
		return rentalCount+"@"+rentalCost;
	}
	
	@RequestMapping(value="searchmachine.action", method=RequestMethod.POST)
	@ResponseBody
	public List<String> searchMachine(String location2, String fmNo) {
		int locationNo2 = Integer.parseInt(location2);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("locationNo2", locationNo2);
		params.put("fmNo", fmNo);
		
		//detailMachine에서 fm_no를통해(FA010000) 해당 머신을 모두 가져온다.
		// status 0 : 대여가능,	 1 : 대여불가능
		int rentalCount = detailMachineService.rentalMachineCount(params);
		
		//rentalhistory에서 rentalDate를 통해 DATE별로  
		//Status가 0인 카운트를 세서 가져온다  0:대여 예약, 1: 대여중
		//(date는 sysdate기준으로 +1, +2, +3까지만 연습)
		Date nowDate = new Date();
		Calendar c = Calendar.getInstance(); 
		c.setTime(nowDate); 
		Date calDate = null;
		
		//HashMap<Date, Integer> rentalCountByDate = new HashMap<Date, Integer>();
		List<String> results = new ArrayList<String>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); //dateForCalendar
		SimpleDateFormat format2 = new SimpleDateFormat("yy/MM/dd");  //dateForCount
		for (int i = 0; i < 14; i++) {
			c.add(Calendar.DATE, 1);
			calDate = c.getTime();
			String dateForCount = format2.format(calDate);
			params.put("calDate",dateForCount);
			int count = detailMachineService.rentalMachineCountByDate(params);
			
			if(rentalCount > count){ //해당 날짜별 대여대수와 총 렌탈가능 대수 비교
				String dateForCalendar  = format.format(calDate);
				results.add(dateForCalendar);
			}
		}

		return results;
	}
	
}
