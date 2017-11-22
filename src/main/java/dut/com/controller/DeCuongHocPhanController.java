package dut.com.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dut.com.dao.DeCuongHocPhanDao;
import dut.com.entity.DeCuongHocPhan;
import dut.com.dao.GiangVienDao;
import dut.com.entity.GiangVien;
import dut.com.dao.HocPhanDao;
import dut.com.dao.MucTieuHocPhanDao;
import dut.com.entity.HocPhan;

@Controller
@RequestMapping("/hocphan/{hocphanId}/decuong")
public class DeCuongHocPhanController {
	@Autowired
	DeCuongHocPhanDao dchpDao;
	@Autowired
	GiangVienDao gvDao;
	@Autowired
	HocPhanDao hpDao;
	@Autowired
	MucTieuHocPhanDao mthpDao;
	
	@GetMapping("/add")
	public String create(@PathVariable("hocphanId") int id, ModelMap map){
		map.addAttribute("listGV", gvDao.getItems());
		map.addAttribute("hocphan", hpDao.getItem(id));
		
		return "admin.decuonghocphan.add";
	}
	
	@GetMapping("/")
	public String show(@PathVariable("hocphanId") int hpId, ModelMap map){
		map.addAttribute("decuonghocphan", dchpDao.getItemByHocPhanId(hpId));
		map.addAttribute("giangvien", gvDao.getItem(dchpDao.getItemByHocPhanId(hpId).getGiangVienId()));
		map.addAttribute("giangvienass", gvDao.getItem(dchpDao.getItemByHocPhanId(hpId).getGiangVienAssId()));
		map.addAttribute("hocphan", hpDao.getItem(hpId));
		map.addAttribute("muctieuhp", mthpDao.getItemsByDeCuongId(dchpDao.getItemByHocPhanId(hpId).getId()));
		System.out.println(dchpDao.getItemByHocPhanId(hpId).getId());
		return "admin.decuonghocphan.show";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(@PathVariable("hocphanId") int hpId, @ModelAttribute DeCuongHocPhan deCuongHocPhan){
		deCuongHocPhan.setHocPhanId(hpId);
		dchpDao.add(deCuongHocPhan);
		
		return "redirect:/hocphan/" + hpId + "/decuong/";
	}
}