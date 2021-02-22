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
import model.puntateSerie;

@Controller
public class SerieTvController {
	
	@GetMapping("html/serietv.html")
	public String dammiInfoSerie(HttpSession session, Model model, @RequestParam String titolo) {
		SerieTv s=DBManager.getInstance().serieTvDAO().findByPrimaryKey(titolo);
		List<Recensioni> r=DBManager.getInstance().recensioniDAO().findAll(titolo);
		List<Integer> st=DBManager.getInstance().puntateSerieDAO().findSeasons(titolo);
		model.addAttribute("serie", s);
		model.addAttribute("stagioni",st);
		model.addAttribute("listRecensioni",r);
		List<Utenti> utenti=DBManager.getInstance().recensioniDAO().findUtenti(titolo);
		model.addAttribute("listUtentiRecensioni",utenti);
		if(session.getAttribute("id")!=null) {
			String utente=session.getAttribute("id").toString();
			boolean preferito=DBManager.getInstance().preferitiDAO().findByPrimaryKey(utente, titolo);
			model.addAttribute("presente",preferito);
		}
		return "serietv";
	}
	
	@ResponseBody
	@PostMapping("html/visualizzaInfo")
	public puntateSerie mostraInfo(@RequestParam String titolo,@RequestParam String stagione) {
		puntateSerie p= DBManager.getInstance().puntateSerieDAO().findByPrimaryKey(titolo, Integer.parseInt(stagione));
		
		return p;
	}
	
	@GetMapping("html/aggiungiSerie.html")
	public String paginaAdmin() {
		return "aggiungiSerie";
	}
	
	@ResponseBody
	@PostMapping("html/aggiungiSerie")
	public String aggiungi(HttpSession session,@RequestParam String pathimage,@RequestParam String titolo,@RequestParam String genere,@RequestParam String descrizione, @RequestParam String annoUscita, @RequestParam String regista, @RequestParam String piattaforme, @RequestParam int stagioni) {
		SerieTv serie=new SerieTv(titolo, genere, descrizione, pathimage, false, annoUscita, stagioni, regista, piattaforme);
		DBManager.getInstance().serieTvDAO().save(serie);
		return "Serie Tv aggiunta!";
	}
	
	@ResponseBody
	@PostMapping("html/aggiungiPuntate")
	public String aggiungiPuntate(HttpSession session,@RequestParam String titolo,@RequestParam int stagione,@RequestParam String durata,@RequestParam int puntate) {
		puntateSerie ps=new puntateSerie(titolo, stagione, puntate, durata);
		DBManager.getInstance().puntateSerieDAO().save(ps);
		return "Aggiunta!";
	}
	
	@GetMapping("html/rimuoviDalCatalogoSerie")
	public String rimuovi(@RequestParam String titolo) {
		DBManager.getInstance().preferitiDAO().deleteContenuto(titolo);
		DBManager.getInstance().puntateSerieDAO().delete(titolo);

		DBManager.getInstance().serieTvDAO().delete(titolo);
		return "redirect:/html/index.html";
	}
	@GetMapping("html/rimuoviReceSerie")
	public String rimuoviRece(@RequestParam String utente, @RequestParam String testo, @RequestParam String titolo) {
		Recensioni rec=new Recensioni(titolo, testo, utente);
		DBManager.getInstance().recensioniDAO().delete(rec);
		return "redirect:/html/serietv.html?titolo="+titolo;
	}
}
