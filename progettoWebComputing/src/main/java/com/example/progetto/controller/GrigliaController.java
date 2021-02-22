package com.example.progetto.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import connessioneDB.DBManager;
import model.Film;
import model.SerieTv;

@Controller
public class GrigliaController {
	@GetMapping("html/index.html")
	public String dammiCatalogo(HttpSession session, Model model) {
		boolean inManutenzione=false;
		if(inManutenzione) {
			return "manutenzione";
		}
		List<Film> listFilm= new ArrayList<Film>();
		listFilm = DBManager.getInstance().filmDAO().findAll();
		
		List<SerieTv> listSerie= new ArrayList<SerieTv>();
		listSerie = DBManager.getInstance().serieTvDAO().findAll();
		
		List<Film> listaUnoFilm= new ArrayList<Film>();
		List<SerieTv> listaUnoSerie= new ArrayList<SerieTv>();
		for(int i=0;i<6;i++) {
			listaUnoFilm.add(listFilm.get(i));
			listaUnoSerie.add(listSerie.get(i));
		}
		model.addAttribute("listUnoFilm", listaUnoFilm);
		model.addAttribute("listUnoSerie", listaUnoSerie);

		List<Film> listaDueFilm= new ArrayList<Film>();
		List<SerieTv> listaDueSerie= new ArrayList<SerieTv>();
		for(int i=6;i<12;i++) {
			listaDueFilm.add(listFilm.get(i));
			listaDueSerie.add(listSerie.get(i));
		}
		model.addAttribute("listDueFilm", listaDueFilm);
		model.addAttribute("listDueSerie", listaDueSerie);

		List<Film> listaTreFilm= new ArrayList<Film>();
		List<SerieTv> listaTreSerie= new ArrayList<SerieTv>();
		for(int i=12;i<19;i++) {
			listaTreFilm.add(listFilm.get(i));
		}
		for(int i=12;i<16;i++) {
			listaTreSerie.add(listSerie.get(i));
		}
		model.addAttribute("listTreFilm", listaTreFilm);
		model.addAttribute("listTreSerie", listaTreSerie);

		return "index";
	
	}
	
	@PostMapping("html/cerca")
	public String cerca(@RequestParam String titolo) {
		Film f=DBManager.getInstance().filmDAO().findByPrimaryKey(titolo);
		SerieTv s=DBManager.getInstance().serieTvDAO().findByPrimaryKey(titolo);
		if(f==null) {
			if(s==null) {
				return "notfound";
			}
			else {
				return "redirect:/html/serietv.html?titolo="+titolo;
			}
		}
		else {
			return "redirect:/html/film.html?titolo="+titolo;
		}
	}
}