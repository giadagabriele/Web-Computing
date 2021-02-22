package com.example.progetto.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import connessioneDB.DBManager;
import model.Film;
import model.SerieTv;

@Controller
public class GenereController {
	
	@GetMapping("html/genere.html")
	public String dammiPaginaGenere(Model model, @RequestParam String genere) {
		List<Film> f=DBManager.getInstance().filmDAO().findByGenere(genere);
		if(f.size()==0) {
			return "notfound";
		}
		model.addAttribute("listGenere",f);
		return "genere";
	}
	@GetMapping("html/genereSerie.html")
	public String dammiPaginaGenereSerie(Model model, @RequestParam String genere) {
		List<SerieTv> s=DBManager.getInstance().serieTvDAO().findByGenere(genere);
		if(s.size()==0) {
			return "notfound";
		}
		model.addAttribute("listGenereSerie",s);
		return "genereSerie";
	}
}
