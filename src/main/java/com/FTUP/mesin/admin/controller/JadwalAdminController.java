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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/jadwal")
public class JadwalAdminController {
    
    @Autowired JadwalDao jadwalDao;
    @Autowired DosenDao dosenDao;
    @Autowired MataKuliahDao mataKuliahDao;
    
    @RequestMapping("/tampil")
    public void tampilJadwal(@RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap){
        List<Jadwal> jadwals = jadwalDao.getAllJadwal(kategoriTingkat);
        modelMap.addAttribute("listJadwal",jadwals);
    }
    
    @RequestMapping("/tambah")
    public void inputMatakulihToJadwal(@RequestParam(value = "semester",required = false) Integer semester,
    @RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap){
        if(semester==null){
            semester = 1;
        }
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemesterBukanJadwal(semester, kategoriTingkat);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }

    @RequestMapping("/proses-tambah")
    public String prosesTambahMatkulToJadwal(@RequestParam("idMatkul") Integer idMatkul,
    @RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        jadwalDao.saveJadwalHanyaMatakuliah(idMatkul);
        
        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        redirectAttributes.addFlashAttribute("pesanTambah", "matakuliah telah ditambahkan ke jadwal s1");
        
        return "redirect:tambah?tingkat="+kategoriTingkat;
    }
    
    @RequestMapping(value = "/edit-jadwal" , method = RequestMethod.GET)
    public void formEditJadwal(@RequestParam("id") Integer id,
    @RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap){
        Jadwal jadwal = jadwalDao.getJadwalById(id);
        List<Dosen> dosens = dosenDao.getAllDosen();
        
        modelMap.addAttribute("jadwal", jadwal);
        modelMap.addAttribute("listDosen", dosens);
    }
    
    @RequestMapping(value = "/edit-jadwal" , method = RequestMethod.POST)
    public String prosesEditJadwal(@ModelAttribute Jadwal jadwal, 
    @RequestParam("jamMulaiString") String jam,
    @RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap, RedirectAttributes redirectAttributes) throws ParseException{
        Date jamMulai = new SimpleDateFormat("HH:mm").parse(jam);
        jadwal.setJamMulai(jamMulai);
        
        jadwalDao.saveJadwal(jadwal);
        
        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        if(jadwal.getId()!= null){
            redirectAttributes.addFlashAttribute("pesanTampil", "jadwal telah di update");
        }
        
        return "redirect:tampil?tingkat="+kategoriTingkat;
    }
    
    @RequestMapping("/hapus")
    public String tutupJadwalMatkulS1(@RequestParam("id") Integer id,
    @RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        jadwalDao.deleteJadwal(id);
        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        redirectAttributes.addFlashAttribute("pesanTampil", "matakuliah telah di tutup");
        return "redirect:tampil?tingkat="+kategoriTingkat;
    }

    @RequestMapping("/hapus-semua")
    public String hapusJadwalS1(@RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        jadwalDao.deleteSemuaJadwal();
        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        redirectAttributes.addFlashAttribute("pesanTampil", "jadwal S1 telah dikosongkan");
        return "redirect:tampil?tingkat="+kategoriTingkat;
    }
    
    //D3
    
//    @RequestMapping("/tampil-d3")
//    public void tampilJadwalD3(ModelMap modelMap){
//        List<Jadwal> jadwals = jadwalDao.getAllJadwal("JADWALD3");
//        modelMap.addAttribute("listJadwal",jadwals);
//    }
//    
//    @RequestMapping("/tambah-d3")
//    public void inputMatakulihToJadwalD3(@RequestParam(value = "semester",required = false) Integer semester,
//    ModelMap modelMap){
//        if(semester==null){
//            semester = 1;
//        }
//        
//        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemesterBukanJadwal("JADWALD3",semester);
//        modelMap.addAttribute("listMatkul", mataKuliahs);
//    }
//    
//    @RequestMapping("/proses-tambah-d3")
//    public String prosesTambahMatkulToJadwalD3(@RequestParam("idMatkul") Integer idMatkul,
//    ModelMap modelMap, RedirectAttributes redirectAttributes){
//        jadwalDao.saveJadwalHanyaMatakuliah("JADWALD3",idMatkul);
//        redirectAttributes.addFlashAttribute("jenisPesan", "success");
//        redirectAttributes.addFlashAttribute("pesanTambah", "matakuliah telah ditambahkan ke jadwal d3");
//        return "redirect:tambah-d3";
//    }
//    
//    @RequestMapping(value = "/edit-jadwal-d3" , method = RequestMethod.GET)
//    public void formEditJadwalD3(@RequestParam("id") Integer id,
//    ModelMap modelMap){
//        Jadwal jadwal = jadwalDao.getJadwalById("JADWALD3",id);
//        List<Dosen> dosens = dosenDao.getAllDosen();
//        
//        modelMap.addAttribute("jadwal", jadwal);
//        modelMap.addAttribute("listDosen", dosens);
//    }
//    
//    @RequestMapping(value = "/edit-jadwal-d3" , method = RequestMethod.POST)
//    public String prosesEditJadwalD3(@ModelAttribute Jadwal jadwal, 
//    @RequestParam("jamMulaiString") String jam,
//    ModelMap modelMap, RedirectAttributes redirectAttributes) throws ParseException{
//        Date jamMulai = new SimpleDateFormat("HH:mm").parse(jam);
//        jadwal.setJamMulai(jamMulai);
//        
//        redirectAttributes.addFlashAttribute("jenisPesan", "success");
//        if(jadwal.getId()!= null){
//            redirectAttributes.addFlashAttribute("pesanTampil", "jadwal telah di update");
//        }
//        
//        jadwalDao.saveJadwal("JADWALD3",jadwal);
//        return "redirect:tampil-d3";
//    }
//    
//    @RequestMapping("/hapus-d3")
//    public String tutupJadwalMatkulD3(@RequestParam("id") Integer id,
//    ModelMap modelMap, RedirectAttributes redirectAttributes){
//        jadwalDao.deleteJadwal("JADWALD3",id);
//        redirectAttributes.addFlashAttribute("jenisPesan", "success");
//        redirectAttributes.addFlashAttribute("pesanTampil", "matakuliah telah di tutup");
//        return "redirect:tampil-d3";
//    }
//    
//    @RequestMapping("/hapus-semua-d3")
//    public String hapusJadwalD3(ModelMap modelMap, RedirectAttributes redirectAttributes){
//        jadwalDao.deleteSemuaJadwal("JADWALD3");
//        redirectAttributes.addFlashAttribute("jenisPesan", "success");
//        redirectAttributes.addFlashAttribute("pesanTampil", "jadwal D3 telah dikosongkan");
//        return "redirect:tampil-d3";
//    }
}