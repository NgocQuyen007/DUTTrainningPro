package dut.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dut.com.dao.CTDTDAO;
import dut.com.entity.CTDT;
import dut.com.entity.GiangVien;
import dut.com.libs.LibString;

@Controller
@RequestMapping("ctdt")
public class CTDTController {
	
	@Autowired
	CTDTDAO dao;
	
	@RequestMapping(path = "add", method = RequestMethod.GET)
	public String add(ModelMap map) {
		return "admin.ctdt.add";
	}
	
	@RequestMapping(path="create", method=RequestMethod.POST)
	public String create(){
		dao.add(new CTDT("test", 1, 1, 1));
		return "admin.ctdt.add";
	}

}
