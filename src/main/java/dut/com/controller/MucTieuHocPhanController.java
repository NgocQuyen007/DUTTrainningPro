package dut.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
>>>>>>> 62cd90082271ffae38aee55edc5ac6b7277b35ee

import dut.com.dao.ChuanDauRaCTDTDao;
import dut.com.dao.DeCuongHocPhanDao;
import dut.com.dao.GiangVienDao;
import dut.com.dao.HocPhanDao;
import dut.com.dao.MucTieuDUCTDTDao;
import dut.com.dao.MucTieuHocPhanDao;
import dut.com.entity.MucTieuDUCTDT;
import dut.com.entity.MucTieuHocPhan;

@Controller
@RequestMapping("/hocphan/{hocphanId}/decuong/{decuongId}/muctieu")
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
	public String create(@PathVariable("decuongId") int id, @PathVariable("hocphanId") int hpId, ModelMap map){
		map.addAttribute("cdrCTDT", cdrCTDTDao.getItems());
		map.addAttribute("decuongId", id);
		map.addAttribute("hocphan", hpDao.getHocPhanById(hpId));
		map.addAttribute("muctieuhp", mthpDao.getItemsByDeCuongId(dchpDao.getItemByHocPhanId(hpId).getId()));
		map.addAttribute("chuanDauRa", mtduCTDTDao.getCDRByDeCuongId(dchpDao.getItemByHocPhanId(hpId).getId()));
		
		return "admin.muctieuhocphan.add";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(
			@PathVariable("hocphanId") int hpId, @PathVariable("decuongId") int decuongId,
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
			MucTieuHocPhan mthp = new MucTieuHocPhan(ten[i], trinhDoNangLuc[i], decuongId, moTa[i]);
			int mthpId = mthpDao.add(mthp);
			for (int j=0; j<chuanDauRa[i].length; j++) {
				MucTieuDUCTDT mtduCTDT = new MucTieuDUCTDT(mthpId, Integer.parseInt(chuanDauRa[i][j]));
				mtduCTDTDao.add(mtduCTDT);
			}
		}
		
		return "redirect:/hocphan/" + hpId + "/decuong/";
	}
	
	@RequestMapping(path="/{muctieuId}/edit", method=RequestMethod.POST)
	@ResponseBody
	public String update(
			@PathVariable("hocphanId") int hpId, @PathVariable("decuongId") int decuongId, @PathVariable("muctieuId") int muctieuId,
			HttpServletRequest request
			) {
		int check = mthpDao.update(muctieuId, request.getParameter("moTa"), request.getParameter("trinhDoNangLuc"));
		if (check > 0) {
			return "{\"success\":1}";
		}
		
		return "{\"error\":1}";
	}
	
}
