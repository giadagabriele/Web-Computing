package com.example.progetto.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import connessioneDB.DBManager;
import model.Film;
import model.Recensioni;
import model.SerieTv;
import model.Utenti;

@Controller
public class FilmController {
	
	@GetMapping("html/film.html")
	public String dammiInfoFilm(HttpSession session, Model model, @RequestParam String titolo) {
		Film f=DBManager.getInstance().filmDAO().findByPrimaryKey(titolo);
		List<Recensioni> r=DBManager.getInstance().recensioniDAO().findAll(titolo);
		model.addAttribute("film", f);
		model.addAttribute("listRecensioni",r);
		List<Utenti> utenti=DBManager.getInstance().recensioniDAO().findUtenti(titolo);
		model.addAttribute("listUtentiRecensioni",utenti);
		if(session.getAttribute("id")!=null) {
			String utente=session.getAttribute("id").toString();
			boolean preferito=DBManager.getInstance().preferitiDAO().findByPrimaryKey(utente, titolo);
			model.addAttribute("presente",preferito);
		}
		return "film";
	}
	@ResponseBody
	@PostMapping("html/aggiunto")
	public String aggiungiPreferiti(HttpSession session, @RequestParam String titolo) {
		String utente=session.getAttribute("id").toString();
		DBManager.getInstance().preferitiDAO().save(utente, titolo);
		return "Aggiunto alla Lista Preferiti!";
	}
	
	@ResponseBody
	@PostMapping("html/inviata")
	public String inviaRecensione(HttpSession session, Model model, @RequestParam int stelle, @RequestParam String titolo, @RequestParam String testo) {
		String utente=session.getAttribute("id").toString();
		Recensioni rec=new Recensioni();
		rec.setStelle(stelle);
		rec.setTesto(testo);
		rec.setTitolo(titolo);
		rec.setUtente(utente);
		DBManager.getInstance().recensioniDAO().save(rec);
		return "";
	}
	
	@GetMapping("html/aggiungiFilm.html")
	public String paginaAdmin() {
		return "aggiungiFilm";
	}
	
	@ResponseBody
	@PostMapping("html/aggiungiFilm")
	public String aggiungi(HttpSession session,@RequestParam String pathimage,@RequestParam String titolo,@RequestParam String genere,@RequestParam String descrizione, @RequestParam String annoUscita,@RequestParam int durata, @RequestParam String regista, @RequestParam String piattaforme) {
		Film film=new Film(titolo, genere, descrizione, pathimage, true, annoUscita, durata, regista, piattaforme);
		DBManager.getInstance().filmDAO().save(film);
		return "Film aggiunto!";
	}
	
	@GetMapping("html/rimuoviDalCatalogoFilm")
	public String rimuovi(@RequestParam String titolo) {
		DBManager.getInstance().preferitiDAO().deleteContenuto(titolo);
		DBManager.getInstance().filmDAO().delete(titolo);
		return "redirect:/html/index.html";
	}
	
	@GetMapping("html/rimuoviRece")
	public String rimuoviRece(@RequestParam String utente, @RequestParam String testo, @RequestParam String titolo) {
		Recensioni rec=new Recensioni(titolo, testo, utente);
		DBManager.getInstance().recensioniDAO().delete(rec);
		return "redirect:/html/film.html?titolo="+titolo;
	}
	
}
