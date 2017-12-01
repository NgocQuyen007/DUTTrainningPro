package dut.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dut.com.dao.CTDTDAO;
import dut.com.dao.ChuanDauRaCTDTDao;
import dut.com.dao.HocKiDAO;
import dut.com.dao.HocPhanCTDTDAO;
import dut.com.dao.HocPhanDao;
import dut.com.dao.KhoaDao;
import dut.com.dao.LoaiCTDTDAO;

@Controller
@RequestMapping("ctdt/chuandaura")
public class ChuanDauRaCTDTController {
	
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
	
	@Autowired
	ChuanDauRaCTDTDao chuanDauRaCTDTDAO;
	
	@RequestMapping(path = "add", method = RequestMethod.GET)
	public String add(ModelMap map, @RequestParam("ctdtId") int ctdtId) {
		map.addAttribute("ctdt", ctdtDAO.getById(ctdtId));
		map.addAttribute("dsCDR", chuanDauRaCTDTDAO.getListByCTDT(ctdtId));
		return "admin.chuandauractdt.add";
	}
	
	@RequestMapping(path="create", method=RequestMethod.POST)
	public String create(@RequestParam("ctdtId") int ctdtId, HttpServletRequest request){
		chuanDauRaCTDTDAO.deleteAll(ctdtId);
		
		if (request.getParameterValues("ten") != null) {
			String ten[] = request.getParameterValues("ten");
			String mota[] = request.getParameterValues("mota");
			
			for(int i=0; i<ten.length; i++){
				chuanDauRaCTDTDAO.add(ctdtId, ten[i], mota[i]);
			}
		}
		return "redirect:/ctdt/chuandaura/add?ctdtId="+ctdtId;
	}
}
