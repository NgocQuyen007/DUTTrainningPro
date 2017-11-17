package dut.com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dut.com.dao.HocPhanDao;
import dut.com.dao.KhoiKienThucDao;
import dut.com.entity.HocPhan;
import dut.com.entity.KhoiKienThuc;

@Controller
@RequestMapping("hocphan")
public class HocPhanController {
	
	@Autowired
	HocPhanDao daohp;
	
	@Autowired
	KhoiKienThucDao daokkt;
	
	@GetMapping
	public String index(ModelMap model){
		List<HocPhan> list = new ArrayList<HocPhan>();
		list = daohp.getAll();
		model.addAttribute("list",list);
		return "admin.hocphan.index";
	}
	
	@RequestMapping(path="add", method=RequestMethod.GET)
	public String add(ModelMap model){
		HocPhan hocphan = new HocPhan();
		List<KhoiKienThuc> list = new ArrayList<KhoiKienThuc>();
		list = daokkt.getAll();
		model.addAttribute("listkkt", list);
		model.addAttribute("hocphan", hocphan);
		return "admin.hocphan.add";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String save(@ModelAttribute("hocphan") HocPhan hocphan, ModelMap model){
		System.out.print(hocphan.toString());
		daohp.add(hocphan);
		return "redirect:/hocphan";
	}
	
	@RequestMapping(path="edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap model){
		HocPhan hocphan = new HocPhan();
		hocphan = daohp.getHocPhanById(id);
		List<KhoiKienThuc> list = new ArrayList<KhoiKienThuc>();
		list = daokkt.getAll();
		model.addAttribute("listkkt", list);
		model.addAttribute("hocphan", hocphan);
		return "admin.hocphan.edit";
	}
	
	@RequestMapping(path="edit/edit", method=RequestMethod.POST)
	public String edit(@ModelAttribute("hocphan") HocPhan hocphan, ModelMap model){
		System.out.println(hocphan.toString());
		daohp.update(hocphan);
		return "redirect:/hocphan";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		daohp.delete(id);
		return "redirect:/hocphan";
	}
}
