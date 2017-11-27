package dut.com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dut.com.dao.HocPhanDao;
import dut.com.dao.KhoiKienThucDao;
import dut.com.dao.DeCuongHocPhanDao;
import dut.com.entity.HocPhan;
import dut.com.entity.KhoiKienThuc;
import dut.com.entity.DeCuongHocPhan;

@Controller
@RequestMapping("hocphan")
public class HocPhanController {
	
	@Autowired
	HocPhanDao daohp;
	
	@Autowired
	KhoiKienThucDao daokkt;
	
	@Autowired
	DeCuongHocPhanDao dchpDao;
	
	@GetMapping
	public String index(ModelMap model){
		List<HocPhan> list = new ArrayList<HocPhan>();
		list = daohp.getAll();
		model.addAttribute("list",list);
		return "admin.hocphan.index";
	}
	
	@RequestMapping(path="/{pageid}", method=RequestMethod.GET)
	public String viewpage(@PathVariable int pageid, ModelMap model){
		 int total = 10;  
	        if(pageid==1){}  
	        else{  
	            pageid=(pageid-1)*total+1;  
	        }  
		List<HocPhan> list = new ArrayList<HocPhan>();
		list = daohp.getHocPhanByPage(pageid, total);
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
	public String save(@ModelAttribute("hocphan") HocPhan hocphan, ModelMap model, BindingResult bindingResult){
		if(bindingResult.hasErrors()){
			return "redirect:/hocphan/add?msg=1";
		}
		List<HocPhan> list = daohp.getAll();
		for(HocPhan hp : list){
			if(hp.getMa_hoc_phan().equals(hocphan.getMa_hoc_phan())){
				return "redirect:/hocphan/add?msg=MaHocPhanUnique";
			}
		}
		daohp.add(hocphan);
		return "redirect:/hocphan/?msg=add";
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
	
	@RequestMapping(path="edit/{id}", method=RequestMethod.POST)
	public String edit(@ModelAttribute("hocphan") HocPhan hocphan, @PathVariable int id, ModelMap model, BindingResult bindingResult){
		if(bindingResult.hasErrors()){
			return "redirect:/hocphan/edit/"+id+"?msg=2";
		}
		daohp.update(hocphan);
		return "redirect:/hocphan/?msg=edit";
	}
	
	@RequestMapping(path="show/{id}", method=RequestMethod.GET)
	public String show(@PathVariable("id") int id, ModelMap model){
		HocPhan hocphan = new HocPhan();
		hocphan = daohp.getHocPhanById(id);
		KhoiKienThuc kkt = new KhoiKienThuc();
		kkt = daokkt.getKhoiKienThucById(hocphan.getKhoi_kien_thuc_id());
		int countDCHP = dchpDao.checkExist(id);
		model.addAttribute("hocphan", hocphan);
		model.addAttribute("kkt", kkt);
		model.addAttribute("decuong", countDCHP);
		return "admin.hocphan.show";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		daohp.delete(id);
		return "redirect:/hocphan?msg=del";
	}
}
