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
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("dosenDao")
public class DosenDaoImp implements DosenDao{

    private static final String SQL_GETALL_DOSEN ="SELECT * FROM DOSEN";    
                
    private JdbcTemplate jdbcTemplate;    
    
    private static final class DosenParameterizedRowMapper implements 
            ParameterizedRowMapper<Dosen>{

        public Dosen mapRow(ResultSet rs, int i) throws SQLException {
            Dosen dosen = new Dosen();
            dosen.setID(rs.getInt("ID"));
            dosen.setNIDN(rs.getString("NIDN"));
            dosen.setNama_Dosen(rs.getString("Nama_Dosen"));
            dosen.setAlamat(rs.getString("Alamat"));
            dosen.setNo_Telpon(rs.getString("No_Telpon"));
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
}
