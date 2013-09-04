package com.FTUP.mesin.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatakuliahController {    
    
    @RequestMapping("/edit")
    public void editMatkul(){
        System.out.println("masuk");
    }    
}
