package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.MataKuliahDao;
import com.FTUP.mesin.admin.model.MataKuliah;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/matakuliah")
public class MatakuliahController {    
    @Autowired private MataKuliahDao mataKuliahDao;

//    @RequestMapping("/tampil")
//    public void tampilMatkul(ModelMap modelMap){
//        List<MataKuliah> mataKuliahs = mataKuliahDao.getAllMatkul();
//        modelMap.addAttribute("listMatkul", mataKuliahs);
//    }

    @RequestMapping("/tampil")
    public void tampilMatkulBySemester(@RequestParam(value = "semester",required = false) Integer semester,
    @RequestParam(value = "tingkat") String kategoriTingkat,
    ModelMap modelMap){
        if(semester==null){
            semester = 1;
        }

        //untuk tab
        List<MataKuliah> mkGroupBySemester = mataKuliahDao.getMatkulGroupBySmester(kategoriTingkat);
        modelMap.addAttribute("listSemester", mkGroupBySemester);


        //untuk data mahasiswa
        List<MataKuliah> mataKuliahs = mataKuliahDao.getMatkulBySemester(semester,kategoriTingkat);
        modelMap.addAttribute("listMatkul", mataKuliahs);
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public void formInputMatkul(@RequestParam(value = "id",required = false) Integer id, 
    ModelMap modelMap){
        MataKuliah mataKuliah = mataKuliahDao.getMatkulById(id);
        if(mataKuliah==null){
            mataKuliah = new MataKuliah();
        }
        modelMap.addAttribute("matakuliah",mataKuliah);
    }

    @RequestMapping(value = "/input",method = RequestMethod.POST)
    public String prosesInputMatkul(@ModelAttribute MataKuliah mataKuliah,
    ModelMap modelMap, RedirectAttributes redirectAttributes){

        mataKuliahDao.saveMAtkul(mataKuliah);
        String reqPramDirect="?";

        redirectAttributes.addFlashAttribute("jenisPesan", "success");
        if(mataKuliah.getId() != null){
            redirectAttributes.addFlashAttribute("pesanTampil", "matakuliah telah diupdate");
        }else{
            redirectAttributes.addFlashAttribute("pesanTampil", "matakuliah baru telah ditambahkan");
        }
        
        reqPramDirect+="tingkat="+mataKuliah.getKategoriTingkat()+"&";
        reqPramDirect+="semester="+mataKuliah.getSemester().toString();
        return "redirect:tampil"+reqPramDirect;
    }

    @RequestMapping("/hapus")
    public String hapusMatkul(@RequestParam("id") Integer id,
    @RequestParam(value = "tingkat") String kategoriTingkat,
    ModelMap modelMap, RedirectAttributes redirectAttributes){
        try{
            mataKuliahDao.deleteMatkul(id);
            redirectAttributes.addFlashAttribute("jenisPesan","success");
            redirectAttributes.addFlashAttribute("pesanTampil","data matakuliah telah dihapus");
        }catch(DataIntegrityViolationException dive){
            redirectAttributes.addFlashAttribute("jenisPesan","error");
            redirectAttributes.addFlashAttribute("pesanTampil","matakuliah terjadwal, tidak boleh dihapus !");
        }

        return "redirect:tampil?tingkat="+kategoriTingkat;
    }
}
