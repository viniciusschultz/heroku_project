package com.utfpr.ativadi.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/sobre")
    public String init(Model model) {
        return "sobre";
    }
}
