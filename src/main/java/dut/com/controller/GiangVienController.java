package dut.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dut.com.dao.GiangVienDao;
import dut.com.entity.GiangVien;

@Controller
@RequestMapping("giangvien")
public class GiangVienController {
	
	@Autowired
	GiangVienDao dao;
	
	@GetMapping
	public String index(ModelMap map){
		map.addAttribute("list", dao.getItems());
		return "admin.giangvien.index";
	}
	
	@RequestMapping(path="add", method=RequestMethod.GET)
	public String create(){
		return "admin.giangvien.add";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(@ModelAttribute GiangVien giangvien){
		dao.add(giangvien);
		return "redirect:/giangvien";
	}
	
	// @RequestMapping(path="edit?id=5", method=RequestMethod.GET)
	// public String edit(RequestParam("id") int id){
	
	@RequestMapping(path="edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap map){
		map.addAttribute("giangvien", dao.getItem(id));
		return "admin.giangvien.edit";
	}
	
}
