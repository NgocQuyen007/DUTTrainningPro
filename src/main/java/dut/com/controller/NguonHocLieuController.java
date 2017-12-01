package dut.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import dut.com.dao.NguonHocLieuDao;
import dut.com.dao.LoaiHocLieuDao;
import dut.com.entity.NguonHocLieu;

@Controller
@RequestMapping("/ctdt/{ctdtId}/hocphan/{hocphanId}/decuong/{decuongId}/nguonhoclieu")
public class NguonHocLieuController {
	@Autowired
	NguonHocLieuDao nguonHocLieuDao;
	@Autowired
	LoaiHocLieuDao loaiHocLieuDao;
	
	@GetMapping("/add")
	public String create(@PathVariable("ctdtId") int ctdtId, @PathVariable("decuongId") int id, @PathVariable("hocphanId") int hpid, ModelMap map){
		map.addAttribute("decuongId", id);
		map.addAttribute("hocphanId", hpid);
		map.addAttribute("ctdtId", ctdtId);
		map.addAttribute("loaihoclieu", loaiHocLieuDao.getItems());
		
		return "admin.nguonhoclieu.add";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(
			@PathVariable("ctdtId") int ctdtId, @PathVariable("decuongId") int decuongId, HttpServletRequest request, @PathVariable("hocphanId") int hpId
	){
		String tenHocLieu = request.getParameter("tenHocLieu");
		int loaiHocLieuId = Integer.parseInt(request.getParameter("loaiHocLieuId"));
		NguonHocLieu nhl = new NguonHocLieu(tenHocLieu, decuongId, loaiHocLieuId);
		nguonHocLieuDao.add(nhl);
		
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
