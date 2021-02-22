package com.example.progetto.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import connessioneDB.DBManager;

@Controller
public class PreferitiController {
	@GetMapping("html/listapreferiti.html")
	public String lista(HttpSession session, Model model) {
		if(session.getAttribute("id")!=null) {
			String nomeUtente=session.getAttribute("id").toString();
			List<String> list=DBManager.getInstance().preferitiDAO().findAll(nomeUtente);
			model.addAttribute("listTitoli",list);
		}
		return "listapreferiti";
	}
	@GetMapping("html/rimuoviDallaLista")
	public String rimuoviPreferiti(HttpSession session, @RequestParam String titolo) {
		String utente=session.getAttribute("id").toString();
		if(utente!=null) {
			DBManager.getInstance().preferitiDAO().delete(utente, titolo);
		}
		return "redirect:/html/listapreferiti.html";
	}
}