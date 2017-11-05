package dut.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dut.com.dao.GiangVienDao;

@Controller
@RequestMapping("giangvien")
public class GiangVienController {
	
	@Autowired
	GiangVienDao dao;
	
	@GetMapping
	public String index(){
		System.out.println("LIST giangvien: " +dao.getItems().size());
		return "admin.giangvien.index";
	}
	
	@RequestMapping(path="add", method=RequestMethod.GET)
	public String add(){
		return "admin.giangvien.add";
	}
}
