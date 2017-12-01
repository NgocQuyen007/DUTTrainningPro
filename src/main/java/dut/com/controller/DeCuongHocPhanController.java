package dut.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dut.com.dao.DeCuongHocPhanDao;
import dut.com.dao.GiangVienDao;
import dut.com.dao.HocPhanDao;
import dut.com.dao.MucTieuDUCTDTDao;
import dut.com.dao.MucTieuHocPhanDao;
import dut.com.dao.NguonHocLieuDao;
import dut.com.dao.ChuanDauRaHocPhanDao;
import dut.com.dao.MucTieuDapUngChuanDauRaHocPhanDao;
import dut.com.dao.DCHPCTDTDao;
import dut.com.entity.DeCuongHocPhan;

@Controller
@RequestMapping("/ctdt/{ctdtId}/hocphan/{hpId}/decuong")
public class DeCuongHocPhanController {
	@Autowired
	DeCuongHocPhanDao dchpDao;
	@Autowired
	GiangVienDao gvDao;
	@Autowired
	HocPhanDao hpDao;
	@Autowired
	MucTieuHocPhanDao mthpDao;
	@Autowired
	MucTieuDUCTDTDao mtductdtDao;
	@Autowired
	NguonHocLieuDao nhlDao;
	@Autowired
	ChuanDauRaHocPhanDao cdrhpDao;
	@Autowired
	MucTieuDapUngChuanDauRaHocPhanDao mtducdrhpDao;
	@Autowired
	DCHPCTDTDao dchpctdtDao;
	
	@GetMapping("/add")
	public String create(@PathVariable("hpId") int hpId, @PathVariable("ctdtId") int ctdtId, ModelMap map){
		map.addAttribute("ctdtId", ctdtId);
		map.addAttribute("listGV", gvDao.getItems());
		map.addAttribute("hocphan", hpDao.getHocPhanById(hpId));
		
		return "admin.decuonghocphan.add";
	}
	
	@GetMapping("/")
	public String show(@PathVariable("hpId") int hpId, @PathVariable("ctdtId") int ctdtId, ModelMap map){
		try {
			map.addAttribute("decuonghocphan", dchpDao.getItemByCTDTAndHP(ctdtId, hpId));
		} catch (EmptyResultDataAccessException e) {
			return "redirect:/ctdt/" + ctdtId + "/hocphan/" + hpId + "/decuong/add";
		}
		map.addAttribute("giangvien", gvDao.getItem(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getGiangVienId()));
		map.addAttribute("giangvienass", gvDao.getItem(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getGiangVienAssId()));
		map.addAttribute("hocphan", hpDao.getHocPhanById(hpId));
		map.addAttribute("muctieuhp", mthpDao.getItemsByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		map.addAttribute("chuanDauRa", mtductdtDao.getCDRByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		map.addAttribute("nguonhoclieu", nhlDao.getItemsByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		map.addAttribute("chuandaurahp", cdrhpDao.getItemsByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		map.addAttribute("muctieutuongung", mtducdrhpDao.getMucTieu(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		map.addAttribute("mucdogiangday", mtducdrhpDao.getMucTieuByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		
		return "admin.decuonghocphan.show";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(@PathVariable("hpId") int hpId, @PathVariable("ctdtId") int ctdtId, @ModelAttribute DeCuongHocPhan deCuongHocPhan){
		deCuongHocPhan.setHocPhanId(hpId);
		int dcId = dchpDao.add(deCuongHocPhan);
		dchpctdtDao.update(ctdtId, hpId, dcId);
		return "redirect:/ctdt/" + ctdtId + "/hocphan/" + hpId + "/decuong/";
	}
}
