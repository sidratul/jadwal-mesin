package com.FTUP.mesin.admin.dao.impl;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.model.Dosen;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("dosenDao")
public class DosenDaoImp implements DosenDao{

    private static final String SQL_GETALL_DOSEN ="SELECT * FROM DOSEN ORDER BY Nama_Dosen ASC";
    private static final String SQL_DOSEN_BYID ="SELECT * FROM DOSEN WHERE ID=?";
    private static final String SQL_DELETE_DOSEN_BYID ="DELETE FROM DOSEN WHERE ID=?";
    private static final String SQL_UPDATE_DOSEN ="UPDATE `DOSEN` SET "
            + "`NIDN` = ?,`Nama_Dosen` = ?,`Alamat` = ?,`No_Telpon` = ?,`Email` =?,"
            + "Tempat_Lahir=?, Tgl_Lahir=?, Jabatan=? WHERE `ID` = ?";
    private static final String SQL_INSERT_DOSEN ="INSERT INTO `DOSEN`"
            + "(`NIDN`,`Nama_Dosen`,`Alamat`,`No_Telpon`,`Email`,Tempat_Lahir, Tgl_Lahir, Jabatan)VALUES(?,?,?,?,?,?,?,?)";
    private JdbcTemplate jdbcTemplate;

    private static final class DosenParameterizedRowMapper implements 
            ParameterizedRowMapper<Dosen>{

        public Dosen mapRow(ResultSet rs, int i) throws SQLException {
            Dosen dosen = new Dosen();
            dosen.setId(rs.getInt("ID"));
            dosen.setNidn(rs.getString("NIDN"));
            dosen.setNamaDosen(rs.getString("Nama_Dosen"));
            dosen.setAlamat(rs.getString("Alamat"));
            dosen.setNoTelpon(rs.getString("No_Telpon"));
            dosen.setEmail(rs.getString("Email"));
            dosen.setTempatLahir(rs.getString("Tempat_Lahir"));
            dosen.setTglLahir(rs.getDate("Tgl_Lahir"));
            dosen.setJabatan(rs.getString("Jabatan"));

            return dosen;
        }
    }
    
    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Dosen> getAllDosen() {
        return jdbcTemplate.query(SQL_GETALL_DOSEN, new DosenParameterizedRowMapper());
        
    }
    
    public void saveDosen(Dosen dosen) {
        if(dosen.getId()!= null){
            jdbcTemplate.update(SQL_UPDATE_DOSEN,new Object[]{
                dosen.getNidn(),
                dosen.getNamaDosen(),
                dosen.getAlamat(),
                dosen.getNoTelpon(),
                dosen.getEmail(),
                dosen.getTempatLahir(),
                dosen.getTglLahir(),
                dosen.getJabatan(),
                dosen.getId()
            });
        }else{
            jdbcTemplate.update(SQL_INSERT_DOSEN, new Object[]{
                dosen.getNidn(),dosen.getNamaDosen(),dosen.getAlamat(),dosen.getNoTelpon(),dosen.getEmail(),dosen.getTempatLahir(),dosen.getTglLahir(),dosen.getJabatan()
            } );
        }
    }

    public Dosen getDosenById(Integer id){
        if(id==null){
            return null;
        }else{
            try{
                Dosen dosen = jdbcTemplate.queryForObject(SQL_DOSEN_BYID, new DosenParameterizedRowMapper(),id);
                return dosen;
            }catch(EmptyResultDataAccessException erdae){
                return null;
            }
        }
    }

    public void deleteDosen(Integer id) {
        jdbcTemplate.update(SQL_DELETE_DOSEN_BYID,id);
    }
}
