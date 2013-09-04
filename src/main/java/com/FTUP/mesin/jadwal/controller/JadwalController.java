/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FTUP.mesin.jadwal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author sidratul
 */
@Controller
public class JadwalController {
    
    /**
     *
     */    
    @RequestMapping("index")
    public void index(){
        System.out.println("index");
    }
    
    @RequestMapping("coba")
    public void coba(){
        System.out.println("masuk coba");
    }
}
