package dut.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import dut.com.dao.ChuanDauRaCTDTDao;
import dut.com.dao.DeCuongHocPhanDao;
import dut.com.dao.GiangVienDao;
import dut.com.dao.HocPhanDao;
import dut.com.dao.MucTieuDUCTDTDao;
import dut.com.dao.MucTieuHocPhanDao;
import dut.com.dao.ChuanDauRaHocPhanDao;
import dut.com.dao.MucTieuDapUngChuanDauRaHocPhanDao;
import dut.com.entity.MucTieuDUCTDT;
import dut.com.entity.MucTieuHocPhan;
import dut.com.entity.ChuanDauRaHocPhan;
import dut.com.entity.MucTieuDapUngChuanDauRaHocPhan;

@Controller
@RequestMapping("/ctdt/{ctdtId}/hocphan/{hpId}/decuong/{decuongId}/chuandaurahp")
public class ChuanDauRaHocPhanController {
	@Autowired
	DeCuongHocPhanDao dchpDao;
	@Autowired
	GiangVienDao gvDao;
	@Autowired
	HocPhanDao hpDao;
	@Autowired
	MucTieuHocPhanDao mthpDao;
	@Autowired
	ChuanDauRaCTDTDao cdrCTDTDao;
	@Autowired
	MucTieuDUCTDTDao mtduCTDTDao;
	@Autowired
	ChuanDauRaHocPhanDao cdrhpDao;
	@Autowired
	MucTieuDapUngChuanDauRaHocPhanDao mtducdrhpDao;
	
	@GetMapping("/add")
	public String create(@PathVariable("decuongId") int id, @PathVariable("hpId") int hpId, @PathVariable("ctdtId") int ctdtId, ModelMap map){
		map.addAttribute("decuongId", id);
		map.addAttribute("hocphan", hpDao.getHocPhanById(hpId));
		map.addAttribute("muctieuhp", mthpDao.getItemsByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		map.addAttribute("chuandaurahp", cdrhpDao.getItems());
		map.addAttribute("muctieutuongung", mtducdrhpDao.getMucTieu(id));
		
		return "admin.chuandaurahp.add";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(
			@PathVariable("hpId") int hpId, @PathVariable("decuongId") int decuongId, @PathVariable("ctdtId") int ctdtId,
			HttpServletRequest request
	){
		int countRow = Integer.parseInt(request.getParameter("countRow"));
		String mucTieuHocPhan[][] = new String[countRow][];
		for (int i = 0; i<countRow; i++) {
			mucTieuHocPhan[i] = request.getParameterValues("chuanDauRa"+i);
		}
		String mucDoGiangDay[] = request.getParameterValues("mucDoGiangDay");
		String cdrId[] = request.getParameterValues("cdrid");
		for (int i=0; i<countRow; i++) {
			for (int j=0; j<mucTieuHocPhan[i].length; j++) {
				MucTieuDapUngChuanDauRaHocPhan mtduCDR = new MucTieuDapUngChuanDauRaHocPhan(Integer.parseInt(mucTieuHocPhan[i][j]), Integer.parseInt(cdrId[i]), mucDoGiangDay[i], decuongId);
				mtducdrhpDao.add(mtduCDR);
			}
		}
		
		return "redirect:/ctdt/" + ctdtId + "/hocphan/" + hpId + "/decuong/";
	}
	
//	@RequestMapping(path="/{muctieuId}/edit", method=RequestMethod.POST)
//	@ResponseBody
//	public String update(
//			@PathVariable("hocphanId") int hpId, @PathVariable("decuongId") int decuongId, @PathVariable("muctieuId") int muctieuId,
//			HttpServletRequest request
//			) {
//		int check = mthpDao.update(muctieuId, request.getParameter("moTa"), request.getParameter("trinhDoNangLuc"));
//		if (check > 0) {
//			return "{\"success\":1}";
//		}
//		
//		return "{\"error\":1}";
//	}
	
}
