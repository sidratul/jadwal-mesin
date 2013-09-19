package com.FTUP.mesin.admin.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

public class DosenParameterizedRowMapper implements ParameterizedRowMapper<Dosen>{

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
