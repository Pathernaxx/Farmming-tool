package com.farmingtool.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmingtool.dto.Member;
import com.farmingtool.dto.RentalHistory;
import com.farmingtool.service.DetailMachineService;
import com.farmingtool.service.RentalHistoryService;

@Controller
@RequestMapping(value="rental")
public class RentalController {
	
	private DetailMachineService detailMachineService;
	private RentalHistoryService rentalHistoryService;

	@RequestMapping(value="rentalmain.action", method=RequestMethod.GET)
	public String rentalView() {
		return "rental/rentalmain";
	}
	
	@RequestMapping(value="rentalCheck.action", method=RequestMethod.GET)
	public String rentalCheck() {
		return "rental/rentalcheck";
	}
	
	@RequestMapping(value="calendarTest.action", method=RequestMethod.GET)
	public String calendarTest() {
		return "rental/calendartest";
	}
	
	@RequestMapping(value="rentalMachine.action", method=RequestMethod.GET)
	@ResponseBody
	public String rentalMachine(HttpServletRequest request, HttpSession session) throws ParseException {
		
		//String memberId = ((Member)session.getAttribute("loginuser")).getMemberId();
		
		/* 예약처리는 여기서 페이지 이동은 jsp ajax에서 */
		String rentalDate = request.getParameter("rentalDate");
		String machineNo = request.getParameter("machineNo");
		
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
			
			RentalHistory history = new RentalHistory();
			history.setHistoryRentalDate(rentalDate2); //rentalDate
			history.setHistoryReturnDate(returnDate); //rentalDate + 1
			//history.setHistoryStatus(); //0반납 1대여중
			//history.setMachineNo(machineNo); //select 결과
			//history.setMemberId(memberId); //session
			
			rentalHistoryService.insertRentalHistory(history);
			detailMachineService.updateDetailMachineStatus(machineNo);
			
			result = "aaa";
			
		} catch (java.text.ParseException ex) {
			ex.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="moveToCheckRental.action", method=RequestMethod.GET)
	public String moveToCheckRental() {
		return "rental/rentalcheckpage";
	}

	
}
