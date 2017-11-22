package dut.com.controller;

import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dut.com.dao.DeCuongHocPhanDao;
import dut.com.entity.DeCuongHocPhan;
import dut.com.dao.GiangVienDao;
import dut.com.entity.GiangVien;
import dut.com.dao.HocPhanDao;
import dut.com.dao.MucTieuDUCTDTDao;
import dut.com.entity.HocPhan;
import dut.com.dao.MucTieuHocPhanDao;
import dut.com.entity.MucTieuHocPhan;
import dut.com.entity.MucTieuDUCTDT;
import dut.com.dao.ChuanDauRaCTDTDao;
import dut.com.entity.ChuanDauRaCTDT;

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
		map.addAttribute("hocphan", hpDao.getItem(hpId));
		
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
}
