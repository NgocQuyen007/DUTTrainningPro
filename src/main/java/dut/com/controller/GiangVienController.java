package dut.com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dut.com.dao.GiangVienDao;
import dut.com.dao.HocViDao;
import dut.com.dao.KhoaDao;
import dut.com.entity.GiangVien;
import dut.com.entity.HocVi;
import dut.com.entity.Khoa;
import dut.com.libs.LibString;

@Controller
@RequestMapping("giangvien")
public class GiangVienController {

	@Autowired
	GiangVienDao dao;

	@Autowired
	KhoaDao khoaDao;

	@Autowired
	HocViDao hocviDao;

	@GetMapping
	public String index(ModelMap map, HttpServletRequest request) {
		String sidKhoa = request.getParameter("idKhoa"); 
		if(sidKhoa != null){
			// Tìm kiếm theo khoa sử dụng Ajax
			int idKhoa = Integer.parseInt(request.getParameter("idKhoa"));
			map.addAttribute("khoas", khoaDao.getItems());
			map.addAttribute("giangviens", dao.getItems(idKhoa));
			return "admin.giangvien.index.search.khoa";
		}
		map.addAttribute("khoas", khoaDao.getItems());
		map.addAttribute("giangviens", dao.getItems());
		return "admin.giangvien.index";
	}

	@RequestMapping(path = "add", method = RequestMethod.GET)
	public String add(ModelMap map) {
		map.addAttribute("khoas", khoaDao.getItems());
		map.addAttribute("hocvis", hocviDao.getItems());
		return "admin.giangvien.add";
	}

	@RequestMapping(path = "add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("giangvien") GiangVien giangvien,BindingResult bindingResult,@RequestParam(value="delete_picture",required=false) String key, @RequestParam("idHocVi") int idHocVi,@RequestParam("idKhoa") int idKhoa,  @RequestParam("picture") CommonsMultipartFile commonsMultipartFile, HttpServletRequest request,ModelMap map) throws IllegalStateException, IOException {
		System.out.println("ADD POST: " + giangvien.toString());
		if(bindingResult.hasErrors()){
			map.addAttribute("giangvien", giangvien);
			map.addAttribute("khoas", khoaDao.getItems());
			map.addAttribute("hocvis", hocviDao.getItems());
			return "admin.giangvien.add";
			// return "redirect:/giangvien/add?msg=1";
		}
		
		Khoa khoa = new Khoa();
		khoa.setId(idKhoa);
		giangvien.setKhoa(khoa);
		HocVi hocVi = new HocVi();
		hocVi.setId(idHocVi);
		giangvien.setHocVi(hocVi);
		
		String urldir = request.getServletContext().getRealPath("files");
		File dirfile = new File(urldir);
		if (!dirfile.exists()) {
			dirfile.mkdir();
		}

		String picture = "";
		if(key != null){
			giangvien.setAvatar("");
		} else {
			picture = commonsMultipartFile.getOriginalFilename();
			giangvien.setAvatar(picture);
			
			if (!giangvien.getAvatar().equals("")) {
				picture = LibString.renameDFile(picture);
				giangvien.setAvatar(picture);
			}
		}
		
		try {
			if (dao.add(giangvien) > 0) {
				if (!giangvien.getAvatar().equals("")) {
					
					commonsMultipartFile.transferTo(new File(urldir + File.separator + picture));
					
				}
				return "redirect:/giangvien?msg=add";
			}
		} catch(DataIntegrityViolationException ex){
			// Exception Unique
			String [] arr = ex.getMessage().split("'");
			if(arr[arr.length-1].equals("email_UNIQUE")){
				return "redirect:/giangvien/add?msg=emailUnique";
			} else {
				return "redirect:/giangvien/add?msg=usernameUnique";
			}
		}
		return "";
	}

	@RequestMapping(path = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap map) {
		map.addAttribute("khoas", khoaDao.getItems());
		map.addAttribute("hocvis", hocviDao.getItems());
		map.addAttribute("giangvien", dao.getItem(id));
		return "admin.giangvien.edit";
	}
	
	@RequestMapping(path = "edit/{id}", method = RequestMethod.POST)
	public String edit(@Valid @ModelAttribute GiangVien giangvien,BindingResult bindingResult,@PathVariable int id,@RequestParam(value="delete_picture",required=false) String key, @RequestParam("idHocVi") int idHocVi,@RequestParam("idKhoa") int idKhoa,  @RequestParam("picture") CommonsMultipartFile commonsMultipartFile, HttpServletRequest request) throws Exception, IOException {
		
		if(bindingResult.hasErrors()){
			return "redirect:/giangvien/edit/"+id+"?msg=2";
		}
		
		String picture = commonsMultipartFile.getOriginalFilename();
		String old_picture = dao.getItem(id).getAvatar();
		String urldir = request.getServletContext().getRealPath("files");
		
		giangvien.setId(id);
		
		Khoa khoa = new Khoa();
		khoa.setId(idKhoa);
		giangvien.setKhoa(khoa);
		
		HocVi hocVi = new HocVi();
		hocVi.setId(idHocVi);
		giangvien.setHocVi(hocVi);
		
		
		if(key != null){
			giangvien.setAvatar("");
			if(!old_picture.isEmpty()){
				File file = new File(urldir+File.separator+old_picture);
				file.delete();
			}
		} else {
			// Chọn ảnh mới
			if(!picture.isEmpty()){
				picture = LibString.renameDFile(picture);
				giangvien.setAvatar(picture);
				if(!old_picture.isEmpty()){
					File file = new File(urldir+File.separator+old_picture);
					file.delete();
				}
			} else {
				// để ảnh cũ
				giangvien.setAvatar(old_picture);
			}
		}
		
		try {
			if (dao.edit(giangvien) > 0) {
				// Khác rỗng và khác ảnh cũ
				if (!giangvien.getAvatar().equals("") && !giangvien.getAvatar().equals(old_picture)) {
				
						commonsMultipartFile.transferTo(new File(urldir + File.separator + picture));
	
				}
				return "redirect:/giangvien?msg=edit";
			}
		} catch(DataIntegrityViolationException ex){
			// Exception Unique
			String [] arr = ex.getMessage().split("'");
			if(arr[arr.length-1].equals("email_UNIQUE")){
				return "redirect:/giangvien/edit?msg=emailUnique";
			} else {
				return "redirect:/giangvien/edit?msg=usernameUnique";
			}
		}
		return "";
		
	}
	
	@RequestMapping(path="cpass/{id}", method=RequestMethod.POST)
	public String cpass(@PathVariable int id, @RequestParam("old_password") String old_password,@RequestParam("password") String password, @RequestParam("repassword") String repassword){
		GiangVien giangvien = dao.getItem(id);
		System.out.println("ID: " + giangvien.getPassword());
		System.out.println("CURRENT: " + LibString.md5(old_password));
		if(!giangvien.getPassword().equals(LibString.md5(old_password))){
			// Mật khẩu cũ không chính xác : fail pass
			return "redirect:/giangvien/edit/"+id+"?msg=fpass";
		} else {
			if(!password.equals(repassword)){
				// Xác thực mật khẩu không đúng : fail confirm pass
				return "redirect:/giangvien/edit/"+id+"?msg=fcpass";
			} else {
				// Đổi mật khẩu
				giangvien.setPassword(password);
				if(dao.updatePassword(giangvien) > 0){
					return "redirect:/giangvien/edit/"+id+"?msg=pass";
				}
			}
		}
		return "";
	}
	
	@RequestMapping(path = "del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") int id,HttpServletRequest request) {
		String current_pic = dao.getItem(id).getAvatar();
		if(!current_pic.equals("")){
			String pathfile = request.getServletContext().getRealPath("files") + File.separator + current_pic;
			File filedel = new File(pathfile);
			if(filedel.exists()){
				filedel.delete();
			}
		}
		if(dao.del(id) > 0){
			// Xoa anh ton tai
			return "redirect:/giangvien?msg=del";
		}
		return "";
	}

}
