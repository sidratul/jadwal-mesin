package com.FTUP.mesin.jadwal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
    
    @RequestMapping("/")
    public void login(ModelMap modelMap){
    
    }
    
    @RequestMapping("/failed")
    public String loginError(ModelMap modelMap){
        modelMap.addAttribute("error", true);
        return "login";
    }
    
    @RequestMapping("/logout")
    public String logout(ModelMap modelMap){
        return "login";
    }
    
}
