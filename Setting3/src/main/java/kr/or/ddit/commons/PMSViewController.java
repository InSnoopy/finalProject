package kr.or.ddit.commons;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pms/pmsView.do")
public class PMSViewController {
	@GetMapping
	public String pmsView() {
		return "pms/pmsView";
	}
}
