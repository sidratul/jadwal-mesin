package com.FTUP.mesin.admin.dao.impl;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.model.Dosen;
import java.sql.ResultSet;
import java.sql.SQLException;
//import com.FTUP.mesin.admin.model.DosenParameterizedRowMapper;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("dosenDao")
public class DosenDaoImp implements DosenDao{

    private static final String SQL_GETALL_DOSEN ="SELECT * FROM DOSEN";
    private static final String SQL_DOSEN_BYID ="SELECT * FROM DOSEN WHERE ID=?";
    private static final String SQL_DELETE_DOSEN_BYID ="DELETE FROM DOSEN WHERE ID=?";
    private static final String SQL_INSERT_DOSEN ="INSERT INTO `DOSEN`"
            + "(`NIDN`,`Nama_Dosen`,`Alamat`,`No_Telpon`,`Email`)VALUES(?,?,?,?,?)";
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

            return dosen;
        }
    }
    
    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Dosen> getAllDosen() {
        List<Dosen> dosens = jdbcTemplate.query(SQL_GETALL_DOSEN, new DosenParameterizedRowMapper());
        return dosens;
    }
    
    public void saveDosen(Dosen dosen) {
        if(dosen.getId()!= null){
            
        }else{
            jdbcTemplate.update(SQL_INSERT_DOSEN, new Object[]{
                dosen.getNidn(),dosen.getNamaDosen(),dosen.getAlamat(),dosen.getNoTelpon(),dosen.getEmail()
            } );
        }
    }

    public Dosen getDosenById(Integer id){
        if(id==null){
            return null;
        }else{
            Dosen dosen = jdbcTemplate.queryForObject(SQL_DOSEN_BYID, new DosenParameterizedRowMapper(),id);
            return dosen;
        }
    }

    public void deleteDosen(Integer id) {
        jdbcTemplate.update(SQL_DELETE_DOSEN_BYID,id);
    }
}
