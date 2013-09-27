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
public class JadwalAdminController {
    
    @Autowired JadwalDao jadwalDao;
    @Autowired DosenDao dosenDao;
    @Autowired MataKuliahDao mataKuliahDao;
    
    @RequestMapping("/tampil-s1")
    public void tampilJadwalS1(ModelMap modelMap){
        List<Jadwal> jadwals = jadwalDao.getAllJadwal("JADWALS1");
        modelMap.addAttribute("listJadwal",jadwals);
    }
    
    @RequestMapping("/tampil-d3")
    public void tampilJadwalD3(ModelMap modelMap){
        List<Jadwal> jadwals = jadwalDao.getAllJadwal("JADWALD3");
        modelMap.addAttribute("listJadwal",jadwals);
    }
    
    @RequestMapping("/tambah-s1")
    public void inputMatakulihToJadwalS1(@RequestParam(value = "semester",required = false) Integer semester,
    ModelMap modelMap){
        if(semester==null){
            semester = 1;
        }
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemesterBukanJadwal("JADWALS1",semester);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }
    
    @RequestMapping("/tambah-d3")
    public void inputMatakulihToJadwalD3(@RequestParam(value = "semester",required = false) Integer semester,
    ModelMap modelMap){
        if(semester==null){
            semester = 1;
        }
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemesterBukanJadwal("JADWALD3",semester);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }
    
    @RequestMapping("/proses-tambah-s1")
    public String prosesTambahMatkulToJadwalS1(@RequestParam("idMatkul") Integer idMatkul){
        jadwalDao.saveJadwalHanyaMatakuliah("JADWALS1",idMatkul);
        return "redirect:tambah-s1";
    }
    
    @RequestMapping("/proses-tambah-d3")
    public String prosesTambahMatkulToJadwalD3(@RequestParam("idMatkul") Integer idMatkul){
        jadwalDao.saveJadwalHanyaMatakuliah("JADWALD3",idMatkul);
        return "redirect:tambah-d3";
    }
    
    @RequestMapping(value = "/edit-jadwal-s1" , method = RequestMethod.GET)
    public void formEditJadwalS1(@RequestParam("id") Integer id,
    ModelMap modelMap){
        Jadwal jadwal = jadwalDao.getJadwalById("JADWALS1",id);
        List<Dosen> dosens = dosenDao.getAllDosen();
        
        modelMap.addAttribute("jadwalS1", jadwal);
        modelMap.addAttribute("listDosen", dosens);
    }
    
    @RequestMapping(value = "/edit-jadwal-d3" , method = RequestMethod.GET)
    public void formEditJadwalD3(@RequestParam("id") Integer id,
    ModelMap modelMap){
        Jadwal jadwal = jadwalDao.getJadwalById("JADWALS1",id);
        List<Dosen> dosens = dosenDao.getAllDosen();
        
        modelMap.addAttribute("jadwalS1", jadwal);
        modelMap.addAttribute("listDosen", dosens);
    }
    
    
    @RequestMapping(value = "/edit-jadwal-s1" , method = RequestMethod.POST)
    public String prosesEditJadwalS1(@ModelAttribute Jadwal jadwal, 
    @RequestParam("jamMulaiString") String jam,
    ModelMap modelMap) throws ParseException{
        Date jamMulai = new SimpleDateFormat("HH:mm").parse(jam);
        jadwal.setJamMulai(jamMulai);
        
        jadwalDao.saveJadwal("JADWALD3",jadwal);
        return "redirect:tampil-d3";
    }
    
    @RequestMapping(value = "/edit-jadwal-d3" , method = RequestMethod.POST)
    public String prosesEditJadwalD3(@ModelAttribute Jadwal jadwal, 
    @RequestParam("jamMulaiString") String jam,
    ModelMap modelMap) throws ParseException{
        Date jamMulai = new SimpleDateFormat("HH:mm").parse(jam);
        jadwal.setJamMulai(jamMulai);
        
        jadwalDao.saveJadwal("JADWALD3",jadwal);
        return "redirect:tampil-d3";
    }
    
    @RequestMapping("/hapus-s1")
    public String tutupJadwalMatkulS1(@RequestParam("id") Integer id,
    ModelMap modelMap){
        jadwalDao.deleteJadwal("JADWALS1",id);
        return "redirect:tampil-s1";
    }
    
    @RequestMapping("/hapus-d3")
    public String tutupJadwalMatkulD3(@RequestParam("id") Integer id,
    ModelMap modelMap){
        jadwalDao.deleteJadwal("JADWALD3",id);
        return "redirect:tampil-d3";
    }
    
    @RequestMapping("/hapus-semua-s1")
    public String hapusJadwalS1(ModelMap modelMap){
        jadwalDao.deleteSemuaJadwal("JADWALD1");
        return "redirect:tampil-s1";
    }
    
    @RequestMapping("/hapus-semua-d3")
    public String hapusJadwalD3(ModelMap modelMap){
        jadwalDao.deleteSemuaJadwal("JADWALD3");
        return "redirect:tampil-d3";
    }
}