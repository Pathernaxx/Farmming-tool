package com.farmingtool.controller;

import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.jasper.tagplugins.jstl.core.Url;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.farmingtool.dto.Accident;
import com.farmingtool.dto.FarmMachine;
import com.farmingtool.dto.Accident;
import com.farmingtool.service.FarmMachineService;


@Controller
@RequestMapping(value="dictionary")
public class DictionaryController {
	
	
	private FarmMachineService farmMachineService;
	@Autowired
	@Qualifier("farmMachineService")
	public void setFarmMachineService(FarmMachineService farmMachineService) {
		this.farmMachineService = farmMachineService;
	}
	
	
	@RequestMapping(value="view.action", method= RequestMethod.GET)
	public ModelAndView DictionaryApp(){
		
		ModelAndView mav = new ModelAndView();
		List<FarmMachine> farmMachineList = farmMachineService.getFarmMachineList();
		
		/*for(FarmMachine fmList :  farmMachineList){
			System.out.println(fmList.getFmNo());
		}*/
		
		mav.addObject("farmMachineList", farmMachineList);
		mav.setViewName("dictionary/cover");

		return mav;
	}
	@RequestMapping(value="showdetail.action", method= RequestMethod.GET)
	public ModelAndView DictionaryDetail(String fmno){
		ModelAndView mav = new ModelAndView();
		FarmMachine farmMachineDetail = farmMachineService.getFarmMachineDetail(fmno);
		mav.addObject("farmMachineDetail", farmMachineDetail);
		mav.setViewName("dictionary/coverdetail");
		return mav;
	}
	@RequestMapping(value="test.action", method= RequestMethod.GET)
	public ModelAndView test11(){
		
		ModelAndView mav = new ModelAndView();
		List<FarmMachine> farmMachineList = farmMachineService.getFarmMachineList();
		
		/*for(FarmMachine fmList :  farmMachineList){
			System.out.println(fmList.getFmNo());
		}*/
		
		mav.addObject("farmMachineList", farmMachineList);
		mav.setViewName("dictionary/test3");

		return mav;
	}
	
	
	
	
	@RequestMapping(value="ajaxfmList.action", method = RequestMethod.GET)
	@ResponseBody
	public List<FarmMachine> ajaxfmList(String typeNo) {
		List<FarmMachine> fmBytypeNo = farmMachineService.getFarmMachineDetailBytypeNo(typeNo);
	
		return fmBytypeNo;
	}
	

	@RequestMapping(value="accident.action", method= RequestMethod.GET)
	public ModelAndView Accident(){
		List<Accident> accs = new ArrayList<Accident>();
		   try{
			   String path = "http://www.rda.go.kr/openapidata/service/rdamachinesafe_api/rdamachinesafe_list?searchtype=1&numOfRows=109&searchword&ServiceKey=rqAjAvGfqCjlp1VVOTV2bozxgaidcSO6NWGRlJqpOmnY0VoUixTQcSxqoLPGDnSqWcqepGMeQKPFZog7UiaIJg%3D%3D";	
			   
			   DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			   DocumentBuilder builder = factory.newDocumentBuilder();
			   Document document = builder.parse(path);
			   NodeList content = document.getElementsByTagName("content");
			   NodeList downurl = document.getElementsByTagName("downurl");
			   NodeList pclass = document.getElementsByTagName("PClass");
			   
			   
			   for(int i=0; i< content.getLength(); i++){
				   Accident acc = new Accident();
				   acc.setContent(content.item(i).getFirstChild().getNodeValue());  
				   acc.setDownUrl(downurl.item(i).getFirstChild().getNodeValue());
				   acc.setpClass(pclass.item(i).getFirstChild().getNodeValue());
				   accs.add(acc);
			   }
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		ModelAndView mav = new ModelAndView();
		mav.addObject("accs",accs);
		mav.setViewName("dictionary/accident");
		return mav;
	}	
	@RequestMapping(value="accident.action", method= RequestMethod.POST)
	@ResponseBody
	public List<Accident> AccidentPost(String searchword){
		System.out.println(searchword);
		List<Accident> accs = new ArrayList<Accident>();
		   try{
			   String path = "http://www.rda.go.kr/openapidata/service/rdamachinesafe_api/rdamachinesafe_list?searchtype=1&numOfRows=109&searchword=&ServiceKey=rqAjAvGfqCjlp1VVOTV2bozxgaidcSO6NWGRlJqpOmnY0VoUixTQcSxqoLPGDnSqWcqepGMeQKPFZog7UiaIJg%3D%3D";
			   DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			   DocumentBuilder builder = factory.newDocumentBuilder();
			   
			   Document document = builder.parse(path);
			   NodeList content = document.getElementsByTagName("content");
			   NodeList downurl = document.getElementsByTagName("downurl");
			   NodeList pclass = document.getElementsByTagName("PClass");
			   
			   
			   for(int i=0; i< content.getLength(); i++){
				  if(pclass.item(i).getFirstChild().getNodeValue().equals(searchword)){
				   Accident acc = new Accident();
				   acc.setContent(content.item(i).getFirstChild().getNodeValue());  
				   acc.setDownUrl(downurl.item(i).getFirstChild().getNodeValue());
				   acc.setpClass(pclass.item(i).getFirstChild().getNodeValue());
				   accs.add(acc);
				  }
			   }
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   return accs;
	}

	
	@RequestMapping(value="ajaxfmSearch.action", method = RequestMethod.GET)
	@ResponseBody
	public List<FarmMachine> ajaxfmSearch(String searchword) {
		List<FarmMachine> fmSearchList = farmMachineService.getFMSearchBySearchword(searchword);

		/*for(FarmMachine fmList :  fmSearchList){
		System.out.println(fmList.getFmNo());
		}*/
		
		return fmSearchList;
	}
	
	
	
	
	

	
}
