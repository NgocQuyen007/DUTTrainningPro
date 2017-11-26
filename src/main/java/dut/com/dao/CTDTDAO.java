package dut.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dut.com.dao.rowmapper.CTDTRowMapper;
import dut.com.dao.rowmapper.HocPhanRowMapper;
import dut.com.entity.CTDT;
import dut.com.entity.HocKi;
import dut.com.entity.HocPhan;
import dut.com.entity.HocPhanCTDT;
import dut.com.entity.HocPhanHocKiCTDT;

@Repository
public class CTDTDAO {
	@Autowired
	private CTDTDAO ctdtDAO;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	HocPhanCTDTDAO hocPhanCTDTDAO;
	
	@Autowired
	HocKiDAO hocKiDAO;
	
	public List<CTDT> getItems(){
		String sql = "SELECT ctdt.*, k.id khoaId, k.ten tenKhoa, k.giao_vu_khoa_id, l.id loaiId, l.ten tenLoai FROM chuong_trinh_dao_tao ctdt "
					+ "JOIN khoa k ON k.id = ctdt.khoa_id "
					+ "JOIN loai l ON l.id = ctdt.loai_id;";
		return jdbcTemplate.query(sql, new CTDTRowMapper());
	}
	
	public boolean add(CTDT ctdt) {	
		try {
			String sql = "INSERT INTO chuong_trinh_dao_tao(ten, khoa_id, nien_khoa, loai_id) VALUES(?,?,?,?)";
			jdbcTemplate.update(sql, new Object[]{ctdt.getTen(), ctdt.getKhoaId(), ctdt.getNienKhoa(), ctdt.getLoaiId()});
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public CTDT getById(int id){
		String sql = "SELECT ctdt.*, k.id khoaId, k.ten tenKhoa, k.giao_vu_khoa_id, l.id loaiId, l.ten tenLoai FROM chuong_trinh_dao_tao ctdt "
					+ "JOIN khoa k ON k.id = ctdt.khoa_id "
					+ "JOIN loai l ON l.id = ctdt.loai_id where ctdt.id = ? LIMIT 1;";
		CTDT ctdt = jdbcTemplate.queryForObject(sql, new CTDTRowMapper(), new Object[]{id});
//		List<HocPhanCTDT> hocPhanCTDTList = hocPhanCTDTDAO.getItems(id);
//		List<Integer> hocKiIds = hocPhanCTDTDAO.getHocKiPluck(id);
		List<HocKi> hocKis = hocKiDAO.getItemsFromListId(id);
		System.out.println(hocKis.size());
		List<HocPhanHocKiCTDT> hocPhanHocKiCTDTs = new ArrayList<HocPhanHocKiCTDT>();
		for (HocKi hocKi : hocKis) {
			List<HocPhan> dsHP = ctdtDAO.getHocPhanByHocKi(id, hocKi.getId());
			System.out.println("dshp: " + dsHP.size());
			hocPhanHocKiCTDTs.add(new HocPhanHocKiCTDT(hocKi, dsHP));
		}
		ctdt.setHocPhanHocKiCTDTs(hocPhanHocKiCTDTs);
		return ctdt;
	}
	
	public List<HocPhan> getHocPhanByHocKi(int ctdtId, int hocKiId){
		System.out.println("get HP: " + hocKiId);
		String sql = "SELECT hp.* FROM hoc_phan_ctdt hc JOIN hoc_phan hp ON hc.hoc_phan_id = hp.id where hc.chuong_trinh_dao_tao_id = ? AND hc.hoc_ki_id = ?;";
		return jdbcTemplate.query(sql, new HocPhanRowMapper(), ctdtId, hocKiId);
	}
	
}
