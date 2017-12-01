package dut.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.dao.rowmapper.HocPhanRowMapper;
import dut.com.dao.rowmapper.ThongTinDeCuongHocPhanRowMapper;
import dut.com.entity.HocPhan;
import dut.com.entity.ThongTinDeCuongHocPhan;
@Repository
public class HocPhanDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public HocPhan getItem(int id) {
		String sql = "SELECT * FROM hoc_phan WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HocPhan>(HocPhan.class), id);
	}
	
	public List<HocPhan> getItems(){
		String sql = "SELECT * FROM hoc_phan";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<HocPhan>(HocPhan.class));
	}
	
	public int updateDeCuong(int decuongid, int id) {
		String sql = "UPDATE hoc_phan SET de_cuong_chi_tiet_id = ? where id = ?";
		return jdbcTemplate.update(sql, decuongid, id);
		}
	public List<HocPhan> getAll(){
		String sql = "SELECT * FROM hoc_phan";
		return jdbcTemplate.query(sql, new HocPhanRowMapper());
	}
	public HocPhan getHocPhanById(int id){
		String sql = "SELECT * FROM hoc_phan WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new HocPhanRowMapper());
	}
	
	public void add(HocPhan hp){
		String sql = "INSERT INTO hoc_phan (vi_name, en_name, ma_hoc_phan, loai_hoc_phan,"
				+ "khoi_kien_thuc_id, so_tin_chi) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sql,hp.getVi_name(),hp.getEn_name(),hp.getMa_hoc_phan(),
				hp.getLoai_hoc_phan(),hp.getKhoi_kien_thuc_id(),hp.getSo_tin_chi());
	}
	
	public void update(HocPhan hp){
		String sql = "UPDATE hoc_phan SET vi_name=?, en_name=?,  ma_hoc_phan=?, loai_hoc_phan=?,"
				+ "khoi_kien_thuc_id=?, so_tin_chi=? where id=?";
		jdbcTemplate.update(sql,hp.getVi_name(),hp.getEn_name(),hp.getMa_hoc_phan(),
				hp.getLoai_hoc_phan(),hp.getKhoi_kien_thuc_id(),hp.getSo_tin_chi(),hp.getId());
	}
	
	public List<HocPhan> getHocPhanByPage(int pageid, int total){
		String sql="select * from hoc_phan limit "+(pageid-1)+","+total;
		return jdbcTemplate.query(sql, new HocPhanRowMapper());
	}
	
	public void delete(int id){
		String sql = "DELETE FROM hoc_phan where id=?";
		jdbcTemplate.update(sql,id);
	}
	

	public ThongTinDeCuongHocPhan getThongTinDCHocPhan(int hpID, int ctdtId){
		String sql = "SELECT hp.id, hp.ma_hoc_phan, hp.vi_name, hp.en_name, hp.ma_hoc_phan_hoc_truoc, hp.ma_hoc_phan_song_hanh, hp.ma_hoc_phan_tien_quyet" 
                  +  " ,hp_ht.vi_name HocPhanHocTruoc, hp_sh.vi_name HocPhanSongHanh, hp_tq.vi_name HocPhanTienQuyet" 
                  +  " ,ctdt.id MaCTDT, ctdt.ten TEN_CTDT, l.ten LOAI_CTDT, hp.so_tiet_ly_thuyet STLT , hp.so_tiet_thuc_hanh STTH"
                  +  " , hp.so_tin_chi ,hp.so_tiet_tu_hoc STTuHoc, hp.dieu_kien_khac"
                  +  " ,gvchinh.ten GVPhuTrach, gvchinh.email EmailGVPT, gvchinh.so_dien_thoai SDTGVPT, kGVPT.ten KHOA_GVPT"
                  +  " ,gvphu.ten GVPhu, gvphu.email EmailGVPhu, gvphu.so_dien_thoai SDTGVPhu, kGVP.ten KHOA_GVP"
                  +  " ,dchp.mo_ta MoTaHocPhan"
                  +  "  FROM hoc_phan hp"

				  +  " LEFT JOIN hoc_phan hp_ht"
				  +  " ON hp.ma_hoc_phan_hoc_truoc = hp_ht.ma_hoc_phan"
				  +  " LEFT JOIN hoc_phan hp_sh"
				  +  " ON hp.ma_hoc_phan_song_hanh = hp_sh.ma_hoc_phan"
				  +  " LEFT JOIN hoc_phan hp_tq"
				  +  " ON hp.ma_hoc_phan_tien_quyet = hp_tq.ma_hoc_phan"
				
				  +  " LEFT JOIN hoc_phan_ctdt hp_ctdt      ON hp.id = hp_ctdt.hoc_phan_id"
				  +  " LEFT JOIN chuong_trinh_dao_tao ctdt  ON hp_ctdt.chuong_trinh_dao_tao_id = ctdt.id"
				  +  " LEFT JOIN loai l                     ON ctdt.loai_id = l.id"
				  +  " LEFT JOIN de_cuong_hoc_phan dchp     ON hp_ctdt.de_cuong_hoc_phan_id =  dchp.id"
				  +  " LEFT JOIN giang_vien   gvchinh       ON dchp.giang_vien_id = gvchinh.id"
				  +  " LEFT JOIN giang_vien   gvphu         ON dchp.giang_vien_ass_id = gvphu.id"
				  +  " JOIN khoa         kGVPT         ON kGVPT.id = gvchinh.khoa_id "
				  +  " JOIN khoa         kGVP          ON kGVP.id = gvphu.khoa_id"
				
				  +  " WHERE hp.id = ? AND hp_ctdt.chuong_trinh_dao_tao_id = ?";
		return jdbcTemplate.queryForObject(sql, new ThongTinDeCuongHocPhanRowMapper(), new Object[]{hpID,ctdtId});
	}
	
}
