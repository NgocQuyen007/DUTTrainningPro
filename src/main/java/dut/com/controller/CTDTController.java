package dut.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dut.com.dao.CTDTDAO;
import dut.com.dao.HocKiDAO;
import dut.com.dao.HocPhanCTDTDAO;
import dut.com.dao.HocPhanDao;
import dut.com.dao.KhoaDao;
import dut.com.dao.LoaiCTDTDAO;
import dut.com.entity.CTDT;
import dut.com.entity.HocPhanCTDT;

@Controller
@RequestMapping("ctdt")
public class CTDTController {
	
	@Autowired
	CTDTDAO ctdtDAO;
	
	@Autowired
	KhoaDao khoaDao;
	
	@Autowired
	LoaiCTDTDAO loaiCTDTDao;
	
	@Autowired
	HocKiDAO hocKiDAO;
	
	@Autowired
	HocPhanDao hocPhanDAO;
	
	@Autowired
	HocPhanCTDTDAO hpCTDTDAO;
	
	@GetMapping
	public String index(ModelMap map) {
		map.addAttribute("ctdts", ctdtDAO.getItems());
		return "admin.ctdt.index";
	}
	
	@RequestMapping(path = "add", method = RequestMethod.GET)
	public String add(ModelMap map) {
		map.addAttribute("khoas", khoaDao.getItems());
		map.addAttribute("loais", loaiCTDTDao.getLoaiCTDT());
		return "admin.ctdt.add";
	}
	
	@RequestMapping(path="create", method=RequestMethod.POST)
	public String create(@RequestParam("khoaId") int khoaId, @RequestParam("loaiId") int loaiId, @RequestParam("ten") String ten, @RequestParam("nienKhoa") String nienKhoa){
		CTDT ctdt = new CTDT(ten, nienKhoa, khoaId, loaiId);
		ctdtDAO.add(ctdt);
		return "redirect:/ctdt";
	}
	
	@RequestMapping(path="update", method=RequestMethod.POST)
	public String update(@RequestParam("id") int id, @RequestParam("khoaId") int khoaId, @RequestParam("loaiId") int loaiId, @RequestParam("ten") String ten, @RequestParam("nienKhoa") String nienKhoa){
		CTDT ctdt = new CTDT(id, ten, nienKhoa, khoaId, loaiId);
		ctdtDAO.update(ctdt);
		return "redirect:/ctdt/"+id+"/edit";
	}
//	ctdt/id/edit
	@RequestMapping(path = "{id}/edit", method = RequestMethod.GET)
	public String edit(ModelMap map, @PathVariable("id") int id) {
		CTDT ctdt = ctdtDAO.getById(id);
		map.addAttribute("ctdt", ctdt);
		map.addAttribute("hocKis", ctdtDAO.getHocKiRemain(id));
		map.addAttribute("hocPhans", ctdtDAO.getHocPhanRemain(id));
		map.addAttribute("khoas", khoaDao.getItems());
		map.addAttribute("loais", loaiCTDTDao.getLoaiCTDT());
		return "admin.ctdt.edit";
	}
	
	@RequestMapping(path="addHP", method=RequestMethod.POST)
	public String addHP(@RequestParam("ctdtId") int ctdtId, @RequestParam("hocKiId") int hocKiId, HttpServletRequest request){
		if (request.getParameterValues("hocPhan") != null) {
			String hocPhan[] = request.getParameterValues("hocPhan");
			for(int i=0; i<hocPhan.length; i++){
				HocPhanCTDT hpCTDT = new HocPhanCTDT(ctdtId, Integer.parseInt(hocPhan[i]), hocKiId);
				hpCTDTDAO.add(hpCTDT);
			}
		}
		return "redirect:/ctdt/"+ctdtId+"/edit";
	}
	
	@RequestMapping(path="addHPToHK", method=RequestMethod.POST)
	public String addHPToHK(@RequestParam("ctdtId") int ctdtId, @RequestParam("hocKiId") int hocKiId, @RequestParam("hocPhanId") int hocPhanId){
		ctdtDAO.addHocPhanCTDT(new HocPhanCTDT(ctdtId, hocPhanId, hocKiId));
		return "redirect:/ctdt/"+ctdtId+"/edit";
	}
	
	@RequestMapping(path="delHPInHK", method=RequestMethod.POST)
	public String delHPInHK(@RequestParam("ctdtId") int ctdtId, @RequestParam("hocKiId") int hocKiId, @RequestParam("hocPhanId") int hocPhanId){
		ctdtDAO.delHocPhanCTDT(new HocPhanCTDT(ctdtId, hocPhanId, hocKiId));
		return "redirect:/ctdt/"+ctdtId+"/edit";
	}
	
	@RequestMapping(path = "{id}/delete", method = RequestMethod.GET)
	public String delete(ModelMap map, @PathVariable("id") int id) {
		ctdtDAO.delelteCTDT(id);
		return "redirect:/ctdt";
	}
	
	@RequestMapping(path="delHocKi", method=RequestMethod.POST)
	public String delHocKi(@RequestParam("ctdtId") int ctdtId, @RequestParam("hocKiId") int hocKiId){
		ctdtDAO.delHocKiCTDT(ctdtId, hocKiId);
		return "redirect:/ctdt/"+ctdtId+"/edit";
	}
	
}
