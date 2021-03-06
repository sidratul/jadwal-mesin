package com.FTUP.mesin.admin.dao;

import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.List;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;

public interface MataKuliahDao {
    public List<MataKuliah> getMatkulGroupBySmester(String kategoriTingkat);
    
    public List<MataKuliah> getAllMatkul(String kategoriTingkat);
    
    public List<MataKuliah> getMatkulBySemester(Integer semester, String kategoriTingkat);
    
    public List<MataKuliah> getMatkulBySemesterBukanJadwal(Integer semester,String kategoriTingkat);
    
    public void saveMAtkul(MataKuliah mataKuliah) throws DuplicateKeyException;
    
    public MataKuliah getMatkulById(Integer id);
    
    public void deleteMatkul(Integer id)throws DataIntegrityViolationException;
    
}
