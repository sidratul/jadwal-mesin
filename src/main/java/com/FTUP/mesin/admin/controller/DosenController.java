package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.model.Dosen;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dosen")
public class DosenController {
    @Autowired private DosenDao dosenDao;
    
    @RequestMapping("/tampil")
    public void tampilDosen(ModelMap modelMap){
        List<Dosen> dosens = dosenDao.getAllDosen();
        for (Dosen dosen : dosens) {
            System.out.println(dosen.getID());
            System.out.println(dosen.getNIDN());
            System.out.println(dosen.getNama_Dosen());
            System.out.println(dosen.getAlamat());
            System.out.println(dosen.getNo_Telpon());
            System.out.println(dosen.getEmail());
        }
        
        modelMap.addAttribute("listDosen",dosens);
    }
}
