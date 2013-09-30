package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.List;
import org.springframework.dao.DataIntegrityViolationException;

public interface MataKuliahDao {
    public List<MataKuliah> getAllMatkul();
    
    public List<MataKuliah> getMatkulBySemester(Integer semester);
    
    public List<MataKuliah> getMatkulBySemesterBukanJadwal(String namaTable,Integer semester);
    
    public void saveMAtkul(MataKuliah mataKuliah);
    
    public MataKuliah getMatkulById(Integer id);
    
    public void deleteMatkul(Integer id)throws DataIntegrityViolationException;
    
}
