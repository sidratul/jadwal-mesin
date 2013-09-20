package com.FTUP.mesin.admin.controller;

import com.FTUP.mesin.admin.dao.DosenDao;
import com.FTUP.mesin.admin.model.Dosen;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatakuliahController {    
    @Autowired private DosenDao dosenDao;
    
//    @RequestMapping("/edit")
//    public void editMatkul(){
//        System.out.println("masuk");
//    }
//    
//    @RequestMapping("/dosen")
//    public void tampilDosen(){
//        List<Dosen> dosens = dosenDao.getAllDosen();
//        for (Dosen dosen : dosens) {
//            System.out.println("Nama :"+dosen.getNama_Dosen());
//            System.out.println("Email :"+dosen.getEmail());
//        }
//    }
}
