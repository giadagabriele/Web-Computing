package com.example.progetto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Hello {
	@GetMapping("/")
	public String home(){
		return "redirect:/html/index.html";
	}
	@GetMapping("html/chisiamo.html")
	public String dammiPagina() {
		return "chisiamo";
	}
}
