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
        
        modelMap.addAttribute("listDosen",dosens);
    }
}
