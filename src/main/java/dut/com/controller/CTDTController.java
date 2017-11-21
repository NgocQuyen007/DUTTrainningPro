package dut.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("ctdt")
public class CTDTController {
	
	@RequestMapping(path = "add", method = RequestMethod.GET)
	public String add(ModelMap map) {
		return "admin.ctdt.add";
	}

}
