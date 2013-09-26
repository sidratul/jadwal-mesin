package com.FTUP.mesin.admin.dao.impl;

import com.FTUP.mesin.admin.dao.PengumumanDao;
import com.FTUP.mesin.admin.model.Pengumuman;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("pengumumanDao")
public class PengumumanDaoImpl implements PengumumanDao{

    private static final String SQL_GETALL_PENGUMUMAN = "SELECT * FROM PENGUMUMAN";
    private static final String SQL_PENGUMUMAN_BYID = "SELECT * FROM PENGUMUMAN WHERE ID=?";
    private static final String SQL_DELETE_PENGUMUMAN = "DELETE FROM PENGUMUMAN";
    private static final String SQL_INSERT_PENGUMUMAN = "INSERT INTO `PENGUMUMAN` (`Text_Pengumuman`)VALUES(?)";
    private static final String SQL_UPDATE_PENGUMUMAN = "UPDATE `PENGUMUMAN` SET `Text_Pengumuman`= ? WHERE ID = ?";
    
    private JdbcTemplate jdbcTemplate;
    
    private static final class PengumumanParameterizedRowMapper implements ParameterizedRowMapper<Pengumuman>{

        public Pengumuman mapRow(ResultSet rs, int i) throws SQLException {
            Pengumuman pengumuman = new Pengumuman();
            pengumuman.setId(rs.getInt("ID"));
            pengumuman.setTextPengumuman(rs.getString("Text_Pengumuman"));
            return pengumuman;
        }
    }
    
    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Pengumuman> getAllPengumuman() {
        List<Pengumuman> pengumumans = jdbcTemplate.query(SQL_GETALL_PENGUMUMAN,new PengumumanParameterizedRowMapper());
        return pengumumans;
    }

    public void savePengumuman(Pengumuman pengumuman) {
        if(pengumuman.getId() != null){
            jdbcTemplate.update(SQL_UPDATE_PENGUMUMAN, new Object[]{pengumuman.getTextPengumuman(), pengumuman.getId()});
        }else{
            jdbcTemplate.update(SQL_INSERT_PENGUMUMAN, new Object[]{pengumuman.getTextPengumuman()});
        }
    }

    public Pengumuman getPengumumanById(Integer id) {
        if(id==null){
            return null;
        }else{
            Pengumuman pengumuman = jdbcTemplate.queryForObject(SQL_PENGUMUMAN_BYID, new PengumumanParameterizedRowMapper(),id);
            return pengumuman;
        }
    }

    public void deletePengumuman(Integer id) {
        jdbcTemplate.update(SQL_DELETE_PENGUMUMAN);
    }
}

