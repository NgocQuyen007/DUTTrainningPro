package dut.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import dut.com.entity.DeCuongHocPhan;
import dut.com.entity.ThongTinDeCuongHocPhan;
import dut.com.libs.LibWords;

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
	@Autowired
	MucTieuDUCTDTDao mtductdtDao;
	@Autowired
	NguonHocLieuDao nhlDao;
	@Autowired
	ChuanDauRaHocPhanDao cdrhpDao;
	@Autowired
	MucTieuDapUngChuanDauRaHocPhanDao mtducdrhpDao;
	
	@GetMapping("/add")
	public String create(@PathVariable("hocphanId") int id, ModelMap map){
		map.addAttribute("listGV", gvDao.getItems());
		map.addAttribute("hocphan", hpDao.getHocPhanById(id));
		
		return "admin.decuonghocphan.add";
	}
	
	@GetMapping("/")
	public String show(@PathVariable("hocphanId") int hpId, ModelMap map){
		map.addAttribute("decuonghocphan", dchpDao.getItemByHocPhanId(hpId));
		map.addAttribute("giangvien", gvDao.getItem(dchpDao.getItemByHocPhanId(hpId).getGiangVienId()));
		map.addAttribute("giangvienass", gvDao.getItem(dchpDao.getItemByHocPhanId(hpId).getGiangVienAssId()));
		map.addAttribute("hocphan", hpDao.getHocPhanById(hpId));
		map.addAttribute("muctieuhp", mthpDao.getItemsByDeCuongId(dchpDao.getItemByHocPhanId(hpId).getId()));
		map.addAttribute("chuanDauRa", mtductdtDao.getCDRByDeCuongId(dchpDao.getItemByHocPhanId(hpId).getId()));
		map.addAttribute("nguonhoclieu", nhlDao.getItemsByDeCuongId(dchpDao.getItemByHocPhanId(hpId).getId()));
		map.addAttribute("chuandaurahp", cdrhpDao.getItemsByDeCuongId(dchpDao.getItemByHocPhanId(hpId).getId()));
		map.addAttribute("muctieutuongung", mtducdrhpDao.getMucTieu(dchpDao.getItemByHocPhanId(hpId).getId()));
		
		return "admin.decuonghocphan.show";
	}
	
	@RequestMapping(path="add", method=RequestMethod.POST)
	public String store(@PathVariable("hocphanId") int hpId, @ModelAttribute DeCuongHocPhan deCuongHocPhan){
		deCuongHocPhan.setHocPhanId(hpId);
		dchpDao.add(deCuongHocPhan);
		
		return "redirect:/hocphan/" + hpId + "/decuong/";
	}
	
	@RequestMapping(path="export", method=RequestMethod.GET)
	public String export(@PathVariable("hocphanId") int hpId, HttpServletRequest request){
		
		ThongTinDeCuongHocPhan item = hpDao.getThongTinDCHocPhan(hpId);
		Map<String, String> maps = mapsItem(item);

		String fileName = "DCHP.docx";
		String contextPath = request.getServletContext().getRealPath("resources/admin");
		String templateName = contextPath + File.separator + fileName;
		
		/*try {
			LibWords.generateAndSendDocx(fullPath, maps);
		} catch (IOException e) {
			System.out.println("Loi nha");
			return "admin.decuonghocphan.export";
		}*/
		final String MAIN_DOCUMENT_PATH = "word/document.xml";
	     final String DATA = "data/";
		
		String filePath = templateName.substring(templateName.lastIndexOf(File.separator)+1, templateName.length());
		String rootPath = templateName.substring(0, templateName.lastIndexOf(File.separator));
		
    	String templateLocation = rootPath + File.separator + DATA + filePath;
        String userTempDir = "replace";
        userTempDir = rootPath + File.separator + DATA + userTempDir + "/";
        
		try {
			LibWords.unzip(new File(templateLocation), new File(userTempDir));
			// Change data
			LibWords.changeData(new File(userTempDir + MAIN_DOCUMENT_PATH), maps);

			LibWords.zip(new File(userTempDir), new File(userTempDir + filePath));
		} catch (IOException e) {
			System.out.println("Looking !!!");
			return "admin.decuonghocphan.export";
		}
		
		try {
			// Send HTTP response
			LibWords.sendDOCXResponse(new File(userTempDir + filePath), filePath);
			// Clean temp data
			LibWords.deleteTempData(new File(userTempDir));

		} catch (NoClassDefFoundError | IOException e) {
			System.out.println("Forward !");
			return "admin.decuonghocphan.export";
		}       

		return "admin.decuonghocphan.export";
	}
	
	public Map<String, String> mapsItem(ThongTinDeCuongHocPhan item){
		Map<String , String> maps = new HashMap<>();
		maps.put("tenHPTiengViet", item.getVi_name());
		maps.put("tenHPTiengAnh", item.getEn_name());
		
		maps.put("maHocPhan", item.getMa_hoc_phan());
		maps.put("chuongTrinhDaoTao", item.getTen_ctdt());
		maps.put("loaiHocPhan", item.getLoai_hoc_phan());
		maps.put("soTinChi", String.valueOf(item.getSo_tin_chi()));
		maps.put("soTietLyThuyet", String.valueOf(item.getSo_tiet_ly_thuyet()));
		maps.put("soTietThucHanh", String.valueOf(item.getSo_tiet_thuc_hanh()));
		maps.put("soTietTuHoc", String.valueOf(item.getSo_tiet_tu_hoc()));
		maps.put("hocPhanTienQuyet", item.getTen_hoc_phan_tien_quyet());
		maps.put("hocPhanHocTruoc", item.getTen_hoc_phan_hoc_truoc());
		maps.put("hocPhanSongHanh", item.getTen_hoc_phan_song_hanh());
		maps.put("dieuKienKhac", item.getDieuKienKhac());
		
		maps.put("giangVienPhuTrach", item.getGiangVienPhuTrach().getTen());
		maps.put("emailGVPT", item.getGiangVienPhuTrach().getEmail());
		maps.put("soDienThoaiGVPT", item.getGiangVienPhuTrach().getSoDienThoai());
		maps.put("khoaBoMonGVPT", item.getGiangVienPhuTrach().getKhoa().getTen());
		
		maps.put("giangVienHoTro", item.getGiangVienPhu().getTen());
		maps.put("emailGVHT", item.getGiangVienPhu().getEmail());
		maps.put("soDienThoaiGVHT", item.getGiangVienPhu().getSoDienThoai());
		maps.put("khoaBoMonGVHT", item.getGiangVienPhu().getKhoa().getTen());
		
		maps.put("moTaHocPhan", item.getMoTaHocPhan());

		return maps;
	}
}
