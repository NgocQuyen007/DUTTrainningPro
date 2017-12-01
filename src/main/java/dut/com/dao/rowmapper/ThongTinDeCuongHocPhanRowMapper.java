package dut.com.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dut.com.entity.GiangVien;
import dut.com.entity.Khoa;
import dut.com.entity.ThongTinDeCuongHocPhan;

public class ThongTinDeCuongHocPhanRowMapper implements RowMapper<ThongTinDeCuongHocPhan>{

	public ThongTinDeCuongHocPhan mapRow(ResultSet rs, int rowNum) throws SQLException {
		ThongTinDeCuongHocPhan obj = new ThongTinDeCuongHocPhan();
		
		obj.setId(rs.getInt("id"));
		obj.setMa_hoc_phan(rs.getString("ma_hoc_phan"));
		obj.setVi_name(rs.getString("vi_name"));
		obj.setEn_name(rs.getString("en_name"));
		obj.setTen_ctdt(rs.getString("TEN_CTDT"));
		obj.setLoai_hoc_phan(rs.getString("LOAI_CTDT"));
		
		obj.setSo_tin_chi(rs.getInt("so_tin_chi"));
		obj.setSo_tiet_ly_thuyet(rs.getInt("STLT"));
		obj.setSo_tiet_thuc_hanh(rs.getInt("STTH"));
		obj.setSo_tiet_tu_hoc(rs.getInt("STTuHoc"));

		obj.setTen_hoc_phan_hoc_truoc(rs.getString("HocPhanHocTruoc"));
		obj.setTen_hoc_phan_song_hanh(rs.getString("HocPhanSongHanh"));
		obj.setTen_hoc_phan_tien_quyet(rs.getString("HocPhanTienQuyet"));
		obj.setDieuKienKhac(rs.getString("dieu_kien_khac"));
		
		GiangVien giangVienPhuTrach = new GiangVien();
		giangVienPhuTrach.setTen(rs.getString("GVPhuTrach"));
		giangVienPhuTrach.setEmail(rs.getString("EmailGVPT"));
		giangVienPhuTrach.setSoDienThoai(rs.getString("SDTGVPT"));
		
		Khoa kGVC = new Khoa();
		kGVC.setTen(rs.getString("KHOA_GVPT"));
		giangVienPhuTrach.setKhoa(kGVC);
		
		GiangVien giangVienPhu = new GiangVien();
		giangVienPhu.setTen(rs.getString("GVPhu"));
		giangVienPhu.setEmail(rs.getString("EmailGVPhu"));
		giangVienPhu.setSoDienThoai(rs.getString("SDTGVPhu"));
		
		Khoa kGVP = new Khoa();
		kGVP.setTen(rs.getString("KHOA_GVP"));
		giangVienPhu.setKhoa(kGVP);
		
		obj.setGiangVienPhu(giangVienPhu);
		obj.setGiangVienPhuTrach(giangVienPhuTrach);
		
		obj.setMoTaHocPhan(rs.getString("MoTaHocPhan"));
		
		return obj;
	}

}
