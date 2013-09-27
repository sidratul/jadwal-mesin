package com.FTUP.mesin.admin.dao.impl;

import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.MataKuliah;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("MatakuliahDao")
public class MatakuliahDaoImp implements MataKuliahDao{
    
    private static final String SQL_GETALL_MATKUL = "SELECT * FROM MATAKULIAH";
    private static final String SQL_MATKUL_BYSEMESTER = "SELECT * FROM MATAKULIAH WHERE SEMESTER=?";
    private static final String SQL_MATKUL_BYID = "SELECT * FROM MATAKULIAH WHERE ID=?";
    private static final String SQL_DELETE_MATKUL = "DELETE FROM MATAKULIAH WHERE ID=?";
    private static final String SQL_INSERT_MATKUL = "INSERT INTO `MATAKULIAH`"
            + "(`Kode_Matkul`,`Nama_Matkul`,`SKS`,`Semester`,`Kategori`)VALUES(?,?,?,?)";
    private static final String SQL_UPDATE_MATKUL = "UPDATE `MATAKULIAH` SET "
            + "`Kode_Matkul` = ? ,`Nama_Matkul` = ?,`SKS` = ?, `Semester` = ?, `Kategori`=? WHERE `ID` = ?";
    
    private JdbcTemplate jdbcTemplate;
    
    private static final class MatakuliahParameterizedRowMapper implements 
            ParameterizedRowMapper<MataKuliah>{

        public MataKuliah mapRow(ResultSet rs, int i) throws SQLException {
            MataKuliah mataKuliah = new MataKuliah();
            mataKuliah.setId(rs.getInt("ID"));
            mataKuliah.setKodeMatkul(rs.getString("Kode_Matkul"));
            mataKuliah.setNamaMatkul(rs.getString("Nama_Matkul"));
            mataKuliah.setSks(rs.getInt("SKS"));
            mataKuliah.setSemester(rs.getInt("Semester"));
            mataKuliah.setKategori(rs.getString("Kategori"));
            
            return mataKuliah;
        }
    
    }
    
    @Autowired
    public void seDataSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<MataKuliah> getAllMatkul() {
        List<MataKuliah> mataKuliahs = jdbcTemplate.query(SQL_GETALL_MATKUL, new MatakuliahParameterizedRowMapper());
        return mataKuliahs;
    }
    
    public List<MataKuliah> getMatkulBySemester(Integer semester) {
        List<MataKuliah> mataKuliahs = jdbcTemplate.query(SQL_MATKUL_BYSEMESTER, new MatakuliahParameterizedRowMapper(),semester);
        return mataKuliahs;
    }
    
    public List<MataKuliah> getMatkulBySemesterBukanJadwal(String namaTable ,Integer semester) {
        String SQL_MATKUL_BYSEMESTER_BUKANJADWAL = "SELECT m.* FROM MATAKULIAH m LEFT JOIN "+namaTable+" j "
            + "ON m.ID = j.ID_Matakuliah WHERE j.ID_Matakuliah is NULL AND SEMESTER=?";
        List<MataKuliah> mataKuliahs = jdbcTemplate.query(SQL_MATKUL_BYSEMESTER_BUKANJADWAL, new MatakuliahParameterizedRowMapper(),semester);
        return mataKuliahs;
    }
    
    public void saveMAtkul(MataKuliah mataKuliah) {
        if(mataKuliah.getId() !=null){
            jdbcTemplate.update(SQL_UPDATE_MATKUL, new Object[]{
                mataKuliah.getKodeMatkul(),mataKuliah.getNamaMatkul(),mataKuliah.getSks(),mataKuliah.getSemester(),mataKuliah.getKategori(),mataKuliah.getId()
            });
        }else{
            jdbcTemplate.update(SQL_INSERT_MATKUL, new Object[]{
                mataKuliah.getKodeMatkul(),mataKuliah.getNamaMatkul(),mataKuliah.getSks(),mataKuliah.getSemester(),mataKuliah.getKategori()
            });
        }
    }

    public MataKuliah getMatkulById(Integer id) {
        if(id==null){
            return null;
        }else{
            MataKuliah mataKuliah = jdbcTemplate.queryForObject(SQL_MATKUL_BYID, new MatakuliahParameterizedRowMapper(),id);
            return mataKuliah;
        }
    }

    public void deleteMatkul(Integer id) {
        jdbcTemplate.update(SQL_DELETE_MATKUL, id);
    }
    
}
