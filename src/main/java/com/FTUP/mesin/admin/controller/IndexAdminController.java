package com.FTUP.mesin.admin.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAdminController {
    
    @RequestMapping("/")
    public String welcomeAdmin(ModelMap modelMap){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        
        modelMap.addAttribute("username", username);
        return "index";
    }
}
