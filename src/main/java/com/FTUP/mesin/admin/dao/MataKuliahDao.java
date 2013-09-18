package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.List;

public interface MataKuliahDao {
    public void saveMatKul(MataKuliah mk);
    
    public List<MataKuliah> getAllMatkul();
    
    public MataKuliah getMatkulById();
    
}
