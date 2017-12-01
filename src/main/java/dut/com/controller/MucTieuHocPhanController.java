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
import dut.com.entity.MucTieuDUCTDT;
import dut.com.entity.MucTieuHocPhan;

@Controller
@RequestMapping("/ctdt/{ctdtId}/hocphan/{hpId}/decuong/{decuongId}/muctieu")
public class MucTieuHocPhanController {
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
	
	@GetMapping("/add")
	public String create(@PathVariable("decuongId") int id, @PathVariable("hpId") int hpId, @PathVariable("ctdtId") int ctdtId, ModelMap map){
		map.addAttribute("cdrCTDT", cdrCTDTDao.getListByCTDT(ctdtId));
		map.addAttribute("decuongId", id);
		map.addAttribute("ctdtId", ctdtId);
		map.addAttribute("hocphan", hpDao.getHocPhanById(hpId));
		map.addAttribute("muctieuhp", mthpDao.getItemsByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		map.addAttribute("chuanDauRa", mtduCTDTDao.getCDRByDeCuongId(dchpDao.getItemByCTDTAndHP(ctdtId, hpId).getId()));
		
		return "admin.muctieuhocphan.add";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(
			@PathVariable("decuongId") int id, @PathVariable("hpId") int hpId, @PathVariable("ctdtId") int ctdtId,
			HttpServletRequest request
	){
		int countRow = Integer.parseInt(request.getParameter("countRow"));
		String chuanDauRa[][] = new String[countRow][];
		for (int i = 0; i<countRow; i++) {
			chuanDauRa[i] = request.getParameterValues("chuanDauRa"+i);
		}
		String ten[] = request.getParameterValues("ten");
		String moTa[] = request.getParameterValues("moTa");
		String trinhDoNangLuc[] = request.getParameterValues("trinhDoNangLuc");
		
		for (int i=0; i<countRow; i++) {
			MucTieuHocPhan mthp = new MucTieuHocPhan(ten[i], trinhDoNangLuc[i], id, moTa[i]);
			int mthpId = mthpDao.add(mthp);
			for (int j=0; j<chuanDauRa[i].length; j++) {
				MucTieuDUCTDT mtduCTDT = new MucTieuDUCTDT(mthpId, Integer.parseInt(chuanDauRa[i][j]));
				mtduCTDTDao.add(mtduCTDT);
			}
		}
		
		return "redirect:/ctdt/" + ctdtId + "/hocphan/" + hpId + "/decuong/";
	}
	
	@RequestMapping(path="/{muctieuId}/edit", method=RequestMethod.POST)
	@ResponseBody
	public String update(
			@PathVariable("hpId") int hpId, @PathVariable("decuongId") int decuongId, @PathVariable("muctieuId") int muctieuId,
			HttpServletRequest request
			) {
		int check = mthpDao.update(muctieuId, request.getParameter("moTa"), request.getParameter("trinhDoNangLuc"));
		if (check > 0) {
			return "{\"success\":1}";
		}
		
		return "{\"error\":1}";
	}
	
}
