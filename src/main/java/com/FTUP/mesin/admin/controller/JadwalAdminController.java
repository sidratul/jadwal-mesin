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
import java.util.logging.Level;
import java.util.logging.Logger;
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
    @RequestParam(value = "hari", required = false) Integer hari,
    ModelMap modelMap){
        if(hari==null){
            hari=2;
        }
        
        //List<Jadwal> jadwals = jadwalDao.getAllJadwal(kategoriTingkat);
        List<Jadwal> jadwals = jadwalDao.getJadwalByHari(kategoriTingkat, hari);
        modelMap.addAttribute("listJadwal",jadwals);
    }
    
    @RequestMapping("/tambah")
    public void inputMatakulihToJadwal(@RequestParam(value = "semester",required = false) Integer semester,
    @RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap){
        if(semester==null){
            semester = 1;
        }
        
        
        List<MataKuliah> mkGroupBySemester = mataKuliahDao.getMatkulGroupBySmester(kategoriTingkat);
        modelMap.addAttribute("listSemester", mkGroupBySemester);
        
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemester(semester, kategoriTingkat);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }

    @RequestMapping("/proses-tambah")
    public String prosesTambahMatkulToJadwal(@RequestParam("idMatkul") Integer idMatkul,
    @RequestParam("tingkat") String kategoriTingkat,
    @RequestParam("semester") String semester,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        jadwalDao.saveJadwalHanyaMatakuliah(idMatkul);
        
        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        redirectAttributes.addFlashAttribute("pesanTambah", "matakuliah telah ditambahkan ke jadwa"+kategoriTingkat);
        
        return "redirect:tambah?tingkat="+kategoriTingkat+"&semester="+semester;
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
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        Date jamMulai;
        try {
            jamMulai = new SimpleDateFormat("HH:mm").parse(jam);
        } catch (ParseException ex) {
            jamMulai=null;
        }
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
    
    @RequestMapping("/hapus-keterangan")
    public String HapusKeterangan(@RequestParam("hari") Integer hari,
    @RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        if(hari==null){
            hari=2;
        }
        
        jadwalDao.deleteKeterangan(hari, kategoriTingkat);
                
        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        redirectAttributes.addFlashAttribute("pesanTampil", "keterangan telah dihapus");
        return "redirect:tampil?tingkat="+kategoriTingkat+"&hari="+hari;
    }

    @RequestMapping("/hapus-semua")
    public String hapusJadwalS1(@RequestParam("tingkat") String kategoriTingkat,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        jadwalDao.deleteSemuaJadwal(kategoriTingkat);
        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        redirectAttributes.addFlashAttribute("pesanTampil", "jadwal "+kategoriTingkat+" telah dikosongkan");
        return "redirect:tampil?tingkat="+kategoriTingkat;
    }
}