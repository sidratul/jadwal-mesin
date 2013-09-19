package com.FTUP.mesin.admin.dao.impl;

import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.List;

public class MatakuliahDaoImp implements MataKuliahDao{
    
    private static final String SQL_GETALL_MATKUL = "SELECT * FROM MATAKULIAH";
    
    public void saveMatKul(MataKuliah mk) {        
    }

    public List<MataKuliah> getAllMatkul() {
        return null;
    }

    public MataKuliah getMatkulById() {
        return null;
        
    }
    
}
