package dut.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dut.com.dao.HocPhanDao;
import dut.com.entity.HocPhan;

@Controller
@RequestMapping("hocphan")
public class HocPhanController {
	@Autowired
	HocPhanDao dao;
	
	@GetMapping
	public String index(Model model){
		List<HocPhan> list = dao.getAll();
		model.addAttribute("list",list);
		return "admin.hocphan.index";
	}
}
