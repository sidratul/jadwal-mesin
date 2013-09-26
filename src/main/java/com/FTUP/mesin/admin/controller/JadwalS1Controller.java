package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.dao.JadwalDao;
import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.Dosen;
import com.FTUP.mesin.admin.model.Jadwal;
import com.FTUP.mesin.admin.model.MataKuliah;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/jadwal")
public class JadwalS1Controller {
    
    @Autowired JadwalDao jadwalDao;
    @Autowired DosenDao dosenDao;
    @Autowired MataKuliahDao mataKuliahDao;
    
    @RequestMapping("/tampil")
    public void tampilJadwal(ModelMap modelMap){
        List<Jadwal> jadwals = jadwalDao.getAllJadwal();
        modelMap.addAttribute("listJadwal",jadwals);
    }
    
    @RequestMapping("/tambah")
    public void inputMatakulihToJadwal(@RequestParam(value = "semester",required = false) Integer semester,
    ModelMap modelMap){
        if(semester==null){
            semester = 1;
        }
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemesterBukanJadwal(semester);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }
    
    @RequestMapping("/proses-tambah")
    public String prosesTambahMatkulToJadwal(@RequestParam("idMatkul") Integer idMatkul){
        jadwalDao.saveJadwalHanyaMatakuliah(idMatkul);
        return "redirect:tambah";
    }
    
    @RequestMapping(value = "/edit-jadwal" , method = RequestMethod.GET)
    public void formEditJadwal(@RequestParam("id") Integer id,
    ModelMap modelMap){
        Jadwal jadwal = jadwalDao.getJadwalById(id);
        List<Dosen> dosens = dosenDao.getAllDosen();
        modelMap.addAttribute("jadwal", jadwal);
        modelMap.addAttribute("listDosen", dosens);
    }
    
    @RequestMapping(value = "/edit-jadwal" , method = RequestMethod.POST)
    public String prosesEditJadwal(@ModelAttribute Jadwal jadwal, 
    @RequestParam("jamMulaiString") String jam,
    ModelMap modelMap) throws ParseException{
        Date jamMulai = new SimpleDateFormat("HH:mm").parse(jam);
        jadwal.setJamMulai(jamMulai);
//        System.out.println(waktu.getTime());
//        System.out.println(jadwal.getDosen().getId());
//        System.out.println(jadwal.getMataKuliah().getId());
//        System.out.println(jadwal.getHari());
//        System.out.println(jadwal.getRuang());
//        System.out.println(jadwal.getKeterangan());
        jadwalDao.saveJadwal(jadwal);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus")
    public String tutupJadwalMatkul(@RequestParam("id") Integer id,
    ModelMap modelMap){
        jadwalDao.deleteJadwal(id);
        return "redirect:tampil";
    }
    
    @RequestMapping("/hapus-semua")
    public String hapusJadwal(ModelMap modelMap){
        jadwalDao.deleteSemuaJadwal();
        return "redirect:tampil";
    }
}
