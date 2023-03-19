package kr.or.ddit.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/priceInfo.do")
public class PriceInfoController {
	@GetMapping
	public String priceInfoView(){
		return "main/priceInfo";
	}
}
