package kr.or.ddit.commons;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/productInfo.do")
public class ProductInfoController {
	@GetMapping
	public String productInfoView() {
		return "main/productInfo";
	}
}
