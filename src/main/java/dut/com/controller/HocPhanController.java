package dut.com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String index(Model model){
		List<HocPhan> list = new ArrayList<HocPhan>();
		list = daohp.getAll();
		model.addAttribute("list",list);
		return "admin.hocphan.index";
	}
	
	@RequestMapping(path="add", method=RequestMethod.GET)
	public String add(Model model){
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
		model.addAttribute("message", "Đã thêm học phần thành công");
		return "admin.hocphan.add";
	}
}
