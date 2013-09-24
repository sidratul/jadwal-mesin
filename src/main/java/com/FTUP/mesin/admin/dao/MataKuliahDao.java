package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.List;

public interface MataKuliahDao {
    public List<MataKuliah> getAllMatkul();
    
    public List<MataKuliah> getMatkulBySemesterBukanJadwal(Integer semester);
    
    public void saveMAtkul(MataKuliah mataKuliah);
    
    public MataKuliah getMatkulById(Integer id);
    
    public void deleteMatkul(Integer id);
    
}
